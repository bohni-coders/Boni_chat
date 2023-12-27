class AddWhatsappCampaignIdToConversations < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :whatsapp_campaign_id, :integer
    add_column :whatsapp_campaigns, :title, :string
  end
end
