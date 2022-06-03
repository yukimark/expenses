class PrimaryItemListsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_permission_check, only: %i[edit update destroy]

  def index
    @primaryitemlists = PrimaryItemList.where(user_id: ['0', current_user.id])
    @primaryitemlist = current_user.primary_item_lists.new
  end

  def create
    @primaryitemlist = current_user.primary_item_lists.new(primaryitemlist_params)
    begin
      @primaryitemlist.save!
      flash[:success] = '保存しました。'
      redirect_to action: 'index'
    rescue StandardError
      flash.now[:danger] = @primaryitemlist.error_message
      @primaryitemlists  = PrimaryItemList.where(user_id: ['0', current_user.id])
      render :index
    end
  end

  def destroy
    @primaryitemlist = PrimaryItemList.find(params[:id])
    @primaryitemlist.destroy
    flash[:success] = '削除しました。'
    redirect_to primary_item_lists_path
  end

  def update
    @primaryitemlist = PrimaryItemList.find(params[:id])
    begin
      @primaryitemlist.update!(primaryitemlist_params)
      flash[:success] = '保存しました。'
      redirect_to primary_item_lists_path
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
    params.require(:primary_item_list).permit(:primary_item, :user_id)
  end

  # before_action

  def edit_permission_check
    return if current_user.primary_item_lists.find_by(id: params[:id])

    flash[:success] = '無効なURLです。'
    redirect_to root_path
  end
end