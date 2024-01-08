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
      processed_params = campaign_params["message_template"]["message"]["template_params"]["processed_params"]
      dynamic_params = campaign_params["message"].scan(/\{\{(\w+)(?::(\w+))?\}\}/)
      campaign_message = campaign_params["message"]

      for contact in contacts_array
        dynamic_params_copy = Marshal.load(Marshal.dump(dynamic_params))
        ind_contact = Contact.find(contact)
        text_to_send = Marshal.load(Marshal.dump(campaign_params["message"]))

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

          text_to_send.gsub!("{{#{param[0]}}}", "#{param[1]}")

          if !all_attributes["{{#{param[0]}}}"]
            all_attributes["{{#{param[0]}}}"] = ["#{param[1]}"]
          else
            all_attributes["{{#{param[0]}}}"].push("#{param[1]}")
          end
        end

        current_conversation = Conversation
          .where(account_id: campaign_params["sender_id"])
          .where(contact_id: contact)
          .first
          
        if current_conversation
          message = Message.new(
            content: text_to_send,
            account_id: ind_contact["account_id"],
            inbox_id: campaign_params["inbox_id"],
            conversation_id: current_conversation["id"],
            # source_id: current_conversation["id"],
            status: "sent",
            message_type: "outgoing",
            processed_message_content: text_to_send
          )

          message.save
        end
      end

      campaign_params_copy = campaign_params.to_h
      campaign_message_text = campaign_params_copy["message_template"]["message"]["content"]

      all_attributes.each{ |pattern, replacement| campaign_message_text.gsub!(pattern, replacement.join(', ')) }

      campaign_params_copy["message_template"]["message"]["content"] = campaign_message_text
      # @whatsapp_campaign = Current.account.whatsapp_campaigns.new(campaign_params_copy)
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
  
