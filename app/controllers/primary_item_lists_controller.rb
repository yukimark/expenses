class PrimaryItemListsController < ApplicationController
  before_action :logged_in_user
  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized

  def index
    @primary_item_lists = current_primary_item_lists.order(:id)
    @primary_item_list = current_primary_item_lists.new
  end

  def create
    @primary_item_list = current_primary_item_lists.new(primary_item_list_params)
    begin
      @primary_item_list.save!
      redirect_to primary_item_lists_path, flash: { success: t('success_message') }
    rescue StandardError
      @primary_item_lists = current_primary_item_lists.order(:id)
      flash.now[:danger] = @primary_item_list.error_message
      render :index
    end
  end

  def destroy
    @primary_item_list = PrimaryItemList.find(params[:id])
    authorize! @primary_item_list
    @primary_item_list.destroy
    redirect_to primary_item_lists_path, flash: { success: t('destroy_message') }
  end

  def update
    @primary_item_list = PrimaryItemList.find(params[:id])
    authorize! @primary_item_list
    begin
      @primary_item_list.update!(primary_item_list_params)
      redirect_to primary_item_lists_path, flash: { success: t('success_message') }
    rescue StandardError
      flash.now[:danger] = @primary_item_list.error_message
      render :edit
    end
  end

  def edit
    @primary_item_list = PrimaryItemList.find(params[:id])
    authorize! @primary_item_list
  end

  private

  def primary_item_list_params
    params.require(:primary_item_list).permit(:name, :user_id, :spend_target_value)
  end

  def user_not_authorized
    redirect_to root_path, flash: { alert: '無効なURLです。' }
  end
end
