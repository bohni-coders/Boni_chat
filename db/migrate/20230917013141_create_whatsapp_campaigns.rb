class CreateWhatsappCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :whatsapp_campaigns, force: :cascade do |t|
      t.integer "display_id", null: false
      t.string "title", null: false
      t.text "message", null: false
      t.jsonb "message_template"
      t.integer "sender_id"
      t.boolean "enabled", default: true
      t.bigint "account_id", null: false
      t.bigint "inbox_id", null: false
      t.integer "campaign_status", default: 0, null: false
      t.jsonb "contacts", default: []
      # t.index ["account_id"], name: "index_campaigns_on_account_id"
      # t.index ["campaign_status"], name: "index_campaigns_on_campaign_status"
      # t.index ["inbox_id"], name: "index_campaigns_on_inbox_id"

      t.timestamps
    end
  end
end