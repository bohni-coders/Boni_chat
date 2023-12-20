# == Schema Information
#
# Table name: whatsapp_campaigns
#
#  id               :bigint           not null, primary key
#  campaign_status  :integer          default(0), not null
#  contacts         :jsonb
#  enabled          :boolean          default(TRUE)
#  message          :text             not null
#  message_template :jsonb
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :bigint           not null
#  display_id       :integer          not null
#  inbox_id         :bigint           not null
#  sender_id        :integer
#
class WhatsappCampaign < ApplicationRecord
  include UrlHelper
  
  belongs_to :inbox
  before_create :set_display_id
  after_save :send_message_to_contacts

  belongs_to :account
  belongs_to :inbox
  belongs_to :sender, class_name: 'User', optional: true

  has_many :conversations, dependent: :nullify, autosave: true

  def set_display_id
    self.display_id = self.account_id
  end

  def send_message_to_contacts
    puts "inside send message ---------------------------"
    puts "--------------------------------------------------"
    puts "----------------------------------------------------"

    CampaignConversationWorker.perform_async(self.id)
  end
end
