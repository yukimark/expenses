class HomesController < ApplicationController
  before_action :logged_in_user, only: %i[setting]
  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized

  def index
    authorize!

    @this_month_spends = current_spends.this_month
    @prev_month_spends = current_spends.prev_month
    @sum_this_month_spends_price = @this_month_spends.sum(:price)
    @sum_prev_month_spends_price = @prev_month_spends.sum(:price)
    @primary_item_lists = current_primary_item_lists.order(:id)
    @sum_spends_target_value = @primary_item_lists.sum(:spend_target_value)
  end

  def setting; end

  private

  def user_not_authorized
    render :index
  end
end
