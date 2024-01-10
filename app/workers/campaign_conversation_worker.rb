class CampaignConversationWorker
  include Sidekiq::Worker
  
  def perform(whatsapp_campaign_id)
    @whatsapp_campaign = WhatsappCampaign.find_by(id: whatsapp_campaign_id)
    return if @whatsapp_campaign.blank?
    


    puts @whatsapp_campaign.message_template.deep_symbolize_keys[:message].to_h[:template_params]

    dynamic_params = @whatsapp_campaign.message_template["message"]["content"].scan(/\{\{(\w+)(?::(\w+))?\}\}/)

    # message = {content: @whatsapp_campaign.message, template_params: @whatsapp_campaign.message_template.deep_symbolize_keys[:message].to_h[:template_params]}.with_indifferent_access
    contacts = @whatsapp_campaign.contacts

    contacts.each do |contact_attr|
      puts "-----------------------------------------------------------------------------"
      puts contact_attr, "------------------------------------------------------------------------------------------------------------------------"

      contact = Contact.find_by(id: contact_attr.to_i)
      next if contact.blank?

      contact_inbox = ContactInboxBuilder.new(contact: contact, inbox: @whatsapp_campaign.inbox, source_id: nil, hmac_verified: false).perform
      next if contact_inbox.blank?

      conversation = find_conversation(contact_attr.to_i)
      conversation = create_conversation(contact_attr, contact_inbox.id, contact) if conversation.blank?
      next unless conversation.persisted?


      template_parameters = Marshal.load(Marshal.dump(@whatsapp_campaign.message_template.deep_symbolize_keys[:message].to_h[:template_params].with_indifferent_access))
      params_counter = 0
      dynamic_param_values = template_parameters["processed_params"].values
      dynamic_param_values_orig = Marshal.load(Marshal.dump(template_parameters["processed_params"].values))

      for param in dynamic_params
        if param[0] == "customAttribute"
          custom_attribute = contact["custom_attributes"][param[1]]

          if custom_attribute
            param[0] = "customAttribute:".concat(param[1])
            param[1] = custom_attribute

          else
            param[0] = "customAttribute:".concat(param[1])
            param[1] = ""
          end

        else
          attribute = contact[param[0]]
          param[1] = attribute
        end

        if dynamic_param_values.index("{{#{param[0]}}}")
          ind = dynamic_param_values.index("{{#{param[0]}}}")
          dynamic_param_values[ind] = param[1] ? param[1] : " "
        end
      end

      for index, value in template_parameters["processed_params"]
        if dynamic_param_values_orig.include?(value)
          ind = dynamic_param_values_orig.index(value)
          template_parameters["processed_params"]["#{ind}"] = dynamic_param_values[ind]
        end
      end

      puts "template_parameters: ", template_parameters
      message = {content: @whatsapp_campaign.message, template_params: template_parameters}.with_indifferent_access

      user = User.find(@whatsapp_campaign.sender_id)


      Messages::MessageBuilder.new(user, conversation, message).perform
      sleep(20)
    end

    @whatsapp_campaign.update(campaign_status: 1)
  end

  private

  def find_conversation(contact_id)
    Conversation.find_by(inbox_id: @whatsapp_campaign.inbox_id, contact_id: contact_id, account_id: @whatsapp_campaign.account_id)
  end

  def create_conversation(contact_attr, contact_inbox_id, contact)
    puts "id: #{@whatsapp_campaign.id}"

    Conversation.create!({
      account_id: @whatsapp_campaign.account_id,
      inbox_id: @whatsapp_campaign.inbox_id,
      whatsapp_campaign_id: @whatsapp_campaign.id,
      contact_id: contact_attr.to_i,
      contact_inbox_id: contact_inbox_id,
      additional_attributes: contact[:additional_attributes],
      custom_attributes: contact[:custom_attributes]
    })
  end

end