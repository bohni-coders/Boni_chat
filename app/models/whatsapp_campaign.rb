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
#  title            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :bigint           not null
#  display_id       :integer          not null
#  inbox_id         :bigint           not null
#  sender_id        :integer
#
class WhatsappCampaign < ApplicationRecord
  include UrlHelper
  
end