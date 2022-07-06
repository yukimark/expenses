class HomesController < ApplicationController
  def index
    return unless user_signed_in?

    d = Time.zone.today
    @spendsthismonth = current_spends.where(created_at: d.in_time_zone.all_month)
    @spendsprevmonth = current_spends.where(created_at: d.prev_month.in_time_zone.all_month)
    @spendsum = @spendsthismonth.sum(:price)
    @primaryitemlists = current_primary_item_lists.order(:id)
    @spend_targetvaluesum = @primaryitemlists.sum(:spend_target_value)
  end

  def setting; end
end
