class AddScheduledAtToWhatsappCampaigns < ActiveRecord::Migration[7.0]
  def change
    add_column :whatsapp_campaigns, :scheduled_at, :datetime
  end
end
