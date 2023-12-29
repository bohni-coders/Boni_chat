class Campaigns::TriggerWhatsappCampaignJob < ApplicationJob
    queue_as :low
  
    def perform(campaign)
      campaign.trigger!
    end
  end
  