class HomesController < ApplicationController
  def index
    return unless user_signed_in?

    d = Time.zone.today
    @spendsthismonth = current_spends.where(created_at: d.in_time_zone.all_month)
    @spendsprevmonth = current_spends.where(created_at: d.prev_month.in_time_zone.all_month)
    @spendsum = @spendsthismonth.sum(:price)
    @primaryitemlists = PrimaryItemList.where_user_id_initial_flag(current_user.id)
  end

  def setting; end
end
