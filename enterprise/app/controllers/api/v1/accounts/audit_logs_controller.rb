class Api::V1::Accounts::AuditLogsController < Api::V1::Accounts::EnterpriseAccountsController
  before_action :check_admin_authorization?
  before_action :fetch_audit

  RESULTS_PER_PAGE = 15

  def show
    @audit_logs = ::Enterprise::AuditLog.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(RESULTS_PER_PAGE)
    @current_page = @audit_logs.current_page
    @total_entries = @audit_logs.total_count
    @per_page = RESULTS_PER_PAGE
  end

  private

  def fetch_audit
    @audit_logs = if audit_logs_enabled?
                    Current.account.associated_audits.order(created_at: :desc)
                  else
                    Current.account.associated_audits.none
                  end
  end

  def audit_logs_enabled?
    Current.account.feature_enabled?(:audit_logs)
  end
end
