class SpendsController < ApplicationController
  before_action :logged_in_user
  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized

  def index
    primary_item_list_id = default_primaty_item_list_id
    @spend = current_spends.new(primary_item_list_id: primary_item_list_id)
    @primary_item_lists = current_primary_item_lists.order(:id)
    @q = current_spends.ransack(params[:q])
    @spends = spends_processing_to_display
  end

  def create
    @spend = current_spends.new(spend_params)
    begin
      @spend.save!
      redirect_to spends_path, flash: { success: t('success_message') }
    rescue StandardError
      @q = current_spends.ransack(params[:q])
      @spends = spends_processing_to_display
      @primary_item_lists = current_primary_item_lists.order(:id)
      flash.now[:danger] = @spend.error_message
      render :index
    end
  end

  def edit
    @spend = Spend.find(params[:id])
    authorize! @spend
    @spend.primary_item_list_id ||= default_primaty_item_list_id
    @primary_item_lists = current_primary_item_lists.order(:id)
  end

  def update
    @spend = Spend.find(params[:id])
    authorize! @spend
    begin
      @spend.update!(spend_params)
      redirect_to spends_path, flash: { success: t('update_message') }
    rescue StandardError
      @primary_item_lists = current_primary_item_lists.order(:id)
      flash.now[:danger] = @spend.error_message
      render :edit
    end
  end

  def destroy
    @spend = Spend.find(params[:id])
    authorize! @spend
    @spend.destroy
    redirect_to spends_path, flash: { success: t('destroy_message') }
  end

  private

  def spend_params
    params.require(:spend).permit(:content, :price, :primary_item_list_id, :user_id)
  end

  def default_primaty_item_list_id
    current_primary_item_lists.find_by(name: '未分類').id
  end

  def spends_processing_to_display
    @q.result.includes(:primary_item_list).order(created_at: :desc).page(params[:page]).per(30)
  end

  def user_not_authorized
    redirect_to root_path, flash: { alert: '無効なURLです。' }
  end
end
