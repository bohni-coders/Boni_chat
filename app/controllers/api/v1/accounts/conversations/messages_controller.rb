class Api::V1::Accounts::Conversations::MessagesController < Api::V1::Accounts::Conversations::BaseController
  def index
    @messages = message_finder.perform
  end

  def create
    user = Current.user || @resource
    mb = Messages::MessageBuilder.new(user, @conversation, params)
    @message = mb.perform
  rescue StandardError => e
    render_could_not_create_error(e.message)
  end

  def update
    ActiveSupport::Logger
    logger.debug "message update api called"
    message = @conversation.messages.find(params[:id])
    message.update!(message_params)
    render json: { success: true }
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def destroy
    ActiveRecord::Base.transaction do
      current_message = Message.find_by(id: params[:id].to_i)
      version = params[:controller]
        .match(/\/v\d+\//)[0] # returns "/v1/"
        .match(/\d+/)[0] # returns the integer within "/v1/" in this case "1" 
        .to_i
      request_id = SecureRandom.uuid || nil

      audit_log = ::Enterprise::AuditLog.new(
        auditable_id: params[:conversation_id].to_i,
        auditable: current_user,
        auditable_type: "AccountUser",
        associated_id: params[:account_id].to_i,
        associated_type: "Account",
        user_id: current_user.id,
        user_type: current_user.type,
        username: current_user.email,
        action: "delete",
        audited_changes: message,
        version: version,
        remote_address: request.remote_ip,
        request_uuid: request_id,
      )

      audit_log.save
      message.update!(content: I18n.t('conversations.messages.deleted'), content_attributes: { deleted: true })
      message.attachments.destroy_all
    end
  end

  def retry
    return if message.blank?

    message.update!(status: :sent, content_attributes: {})
    ::SendReplyJob.perform_later(message.id)
  rescue StandardError => e
    render_could_not_create_error(e.message)
  end

  def translate
    return head :ok if already_translated_content_available?

    translated_content = Integrations::GoogleTranslate::ProcessorService.new(
      message: message,
      target_language: permitted_params[:target_language]
    ).perform

    if translated_content.present?
      translations = {}
      translations[permitted_params[:target_language]] = translated_content
      translations = message.translations.merge!(translations) if message.translations.present?
      message.update!(translations: translations)
    end

    render json: { content: translated_content }
  end

  private

  def message
    @message ||= @conversation.messages.find(permitted_params[:id])
  end

  def message_finder
    @message_finder ||= MessageFinder.new(@conversation, params)
  end

  def permitted_params
    params.permit(:id, :target_language)
  end

  def already_translated_content_available?
    message.translations.present? && message.translations[permitted_params[:target_language]].present?
  end
end
