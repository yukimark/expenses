class PrimaryItemListsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_permission_check, only: %i[edit update destroy]

  def index
    @primaryitemlists = PrimaryItemList.where_user_id_initial_flag(current_user.id)
    @primaryitemlist = current_primary_item_lists.new
  end

  def create
    @primaryitemlist = current_primary_item_lists.new(primaryitemlist_params)
    begin
      @primaryitemlist.save!
      redirect_to primary_item_lists_path, flash: { success: '保存しました。' }
    rescue StandardError
      @primaryitemlists  = PrimaryItemList.where_user_id_initial_flag(current_user.id)
      flash.now[:danger] = @primaryitemlist.error_message
      render :index
    end
  end

  def destroy
    @primaryitemlist = PrimaryItemList.find(params[:id])
    @primaryitemlist.destroy
    redirect_to primary_item_lists_path, flash: { success: '削除しました。' }
  end

  def update
    @primaryitemlist = PrimaryItemList.find(params[:id])
    begin
      @primaryitemlist.update!(primaryitemlist_params)
      redirect_to primary_item_lists_path, flash: { success: '保存しました。' }
    rescue StandardError
      flash.now[:danger] = @primaryitemlist.error_message
      render :edit
    end
  end

  def edit
    @primaryitemlist = PrimaryItemList.find(params[:id])
  end

  private

  def primaryitemlist_params
    params.require(:primary_item_list).permit(:name, :user_id)
  end

  # before_action

  def edit_permission_check
    transition_error if current_primary_item_lists.find_by(id: params[:id], initial_flag: false).blank?
  end
end
