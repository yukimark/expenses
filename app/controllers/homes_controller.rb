class HomesController < ApplicationController
  before_action :logged_in_user, only: %i[setting]
  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized

  def index
    authorize!

    d = Time.zone.today
    @spendsthismonth = current_spends.where(created_at: d.in_time_zone.all_month)
    @spendsprevmonth = current_spends.where(created_at: d.prev_month.in_time_zone.all_month)
    @spendsum = @spendsthismonth.sum(:price)
    @primaryitemlists = current_primary_item_lists.order(:id)
    @spendtargetvaluesum = @primaryitemlists.sum(:spend_target_value)
  end

  def setting; end

  private

  def user_not_authorized
    render :index
  end
end
