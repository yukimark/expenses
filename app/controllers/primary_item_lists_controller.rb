class PrimaryItemListsController < ApplicationController
  before_action :logged_in_user
  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized

  def index
    @primaryitemlists = current_primary_item_lists.order(:id)
    @primaryitemlist = current_primary_item_lists.new
  end

  def create
    @primaryitemlist = current_primary_item_lists.new(primaryitemlist_params)
    begin
      @primaryitemlist.save!
      redirect_to primary_item_lists_path, flash: { success: t('success_message') }
    rescue StandardError
      @primaryitemlists  = current_primary_item_lists.order(:id)
      flash.now[:danger] = @primaryitemlist.error_message
      render :index
    end
  end

  def destroy
    @primaryitemlist = PrimaryItemList.find(params[:id])
    authorize! @primaryitemlist
    @primaryitemlist.destroy
    redirect_to primary_item_lists_path, flash: { success: t('destroy_message') }
  end

  def update
    @primaryitemlist = PrimaryItemList.find(params[:id])
    authorize! @primaryitemlist
    begin
      @primaryitemlist.update!(primaryitemlist_params)
      redirect_to primary_item_lists_path, flash: { success: t('success_message') }
    rescue StandardError
      flash.now[:danger] = @primaryitemlist.error_message
      render :edit
    end
  end

  def edit
    @primaryitemlist = PrimaryItemList.find(params[:id])
    authorize! @primaryitemlist
  end

  private

  def primaryitemlist_params
    params.require(:primary_item_list).permit(:name, :user_id, :spend_target_value)
  end

  def user_not_authorized
    redirect_to root_path, flash: { alert: '無効なURLです。' }
  end
end
