class SpendsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_permission_check, only: %i[edit update destroy]

  def index
    primary_item_list_id = default_primaty_item_list_id
    @spend = current_spends.new(primary_item_list_id: primary_item_list_id)
    @primaryitemlists = current_primary_item_lists.order(:id)
    @q = current_spends.ransack(params[:q])
    @spends = ransack_option(@q)
  end

  def create
    @spend = current_spends.new(spend_params)
    begin
      @spend.save!
      redirect_to spends_path, flash: { success: t('success_message') }
    rescue StandardError
      @q = current_spends.ransack(params[:q])
      @spends = ransack_option(@q)
      @primaryitemlists = current_primary_item_lists.order(:id)
      flash.now[:danger] = @spend.error_message
      render :index
    end
  end

  def edit
    @spend = Spend.find(params[:id])
    @spend.primary_item_list_id ||= default_primaty_item_list_id
    @primaryitemlists = current_primary_item_lists.order(:id)
  end

  def update
    @spend = Spend.find(params[:id])
    begin
      @spend.update!(spend_params)
      redirect_to spends_path, flash: { success: t('update_message') }
    rescue StandardError
      @primaryitemlists = current_primary_item_lists.order(:id)
      flash.now[:danger] = @spend.error_message
      render :edit
    end
  end

  def destroy
    @spend = Spend.find(params[:id])
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

  def ransack_option(ransack)
    ransack.result.includes(:primary_item_list).order(created_at: :desc).page(params[:page]).per(30)
  end

  # before_action

  def edit_permission_check
    transition_error if current_spends.find_by(id: params[:id]).blank?
  end
end
