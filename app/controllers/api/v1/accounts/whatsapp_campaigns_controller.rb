class Api::V1::Accounts::WhatsappCampaignsController < Api::V1::Accounts::BaseController
  before_action :campaign, except: [:index, :create]
  before_action :check_authorization

  def index
    @whatsapp_campaigns = Current.account.whatsapp_campaigns

    puts @whatsapp_campaigns

    render json: @whatsapp_campaigns
  end

  def show; end

  def create
    contacts_array = campaign_params["contacts"]
    all_attributes = {}
    dynamic_params = campaign_params["message"].scan(/\{\{(\w+)(?::(\w+))?\}\}/)

    for contact in contacts_array
      dynamic_params_copy = Marshal.load(Marshal.dump(dynamic_params))
      ind_contact = Contact.find(contact)

      for param in dynamic_params_copy
        if param[0] == "customAttribute"
          custom_attribute = ind_contact["custom_attributes"][param[1]]

          if custom_attribute
            param[0] = "customAttribute:".concat(param[1])
            param[1] = custom_attribute

          else
            param[0] = "customAttribute:".concat(param[1])
            param[1] = ""
          end
          
        else
          attribute = ind_contact[param[0]]
          param[1] = attribute
        end


        if !all_attributes["{{#{param[0]}}}"]
          all_attributes["{{#{param[0]}}}"] = ["#{param[1]}"]
        else
          all_attributes["{{#{param[0]}}}"].push("#{param[1]}")
        end
      end
    end

    campaign_message_text = Marshal.load(Marshal.dump(campaign_params["message_template"]["message"]["content"]))

    all_attributes.each{ |pattern, replacement| campaign_message_text.gsub!(pattern, replacement.join(', ')) }

    # @whatsapp_campaign = Current.account.whatsapp_campaigns.new(campaign_params)
    @whatsapp_campaign = WhatsappCampaign.new(
      message: campaign_message_text,
      message_template: campaign_params["message_template"],
      sender_id: campaign_params["sender_id"], 
      enabled: campaign_params["enabled"], 
      account_id: campaign_params["sender_id"], 
      inbox_id: campaign_params["inbox_id"], 
      campaign_status: 'active', 
      contacts: campaign_params["contacts"], 
      title: campaign_params["title"], 
      scheduled_at: campaign_params["scheduled_at"]
    )
    
    if @whatsapp_campaign.save
      # CampaignConversationWorker.perform_async(@whatsapp_campaign.id)
      render json: { message: "success" }
    end
    head :ok
  end

  def update
    @whatsapp_campaign.update!(campaign_params)
  end

  def destroy
    @whatsapp_campaign.destroy!
    head :ok
  end

  private

  def campaign
    @whatsapp_campaign ||= Current.account.whatsapp_campaigns.find_by(display_id: params[:id])
  end

  def campaign_params
    params.require(:whatsapp_campaign).permit(:title, :scheduled_at, :message, :enabled, :inbox_id, :sender_id, :message_template => {},
      :contacts => []
    )

    # :availability_status, :email, :id, :name, :phone_number, :identifier, :thumbnail, :conversations_count, :last_activity_at, :created_at, :additional_attributes => {}, :custom_attributes => {}
  end

end
