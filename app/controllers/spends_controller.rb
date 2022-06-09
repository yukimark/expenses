class SpendsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_permission_check, only: %i[edit update destroy]

  PRIMARY_ITEM_LIST_ID_INITIAL_MAX = 18

  def index
    @spends = current_user.spends.order(created_at: :desc)
    @spend = current_user.spends.new
    @primaryitemlists = PrimaryItemList.initial_and_useroriginal(current_user.id)
  end

  def create
    params[:spend][:primary_item] = PrimaryItemList.find_by(primary_item: '未分類', initial_flag: true).primary_item if params[:spend][:primary_item].empty?
    primary_item_id = PrimaryItemList.find_by(primary_item: params[:spend][:primary_item]).id
    primary_item_id = PrimaryItemList.find_by(primary_item: params[:spend][:primary_item], user_id: current_user.id).id if primary_item_id > PRIMARY_ITEM_LIST_ID_INITIAL_MAX
    @spend = current_user.spends.new(spend_params.merge(primary_item_list_id: primary_item_id))
    begin
      @spend.save!
      flash[:success] = '保存しました。'
      redirect_to action: 'index'
    rescue StandardError
      flash.now[:danger] = @spend.error_message
      @spends = current_user.spends.order(created_at: :desc)
      @primaryitemlists = PrimaryItemList.initial_and_useroriginal(current_user.id)
      render :index
    end
  end

  def edit
    @spend = Spend.find(params[:id])
    @primaryitemlists = PrimaryItemList.initial_and_useroriginal(current_user.id)
  end

  def update
    params[:spend][:primary_item] = PrimaryItemList.find_by(primary_item: '未分類', initial_flag: true).primary_item if params[:spend][:primary_item].empty?
    primary_item_id = PrimaryItemList.find_by(primary_item: params[:spend][:primary_item]).id
    primary_item_id = PrimaryItemList.find_by(primary_item: params[:spend][:primary_item], user_id: current_user.id).id if primary_item_id > PRIMARY_ITEM_LIST_ID_INITIAL_MAX
    @spend = Spend.find(params[:id])
    begin
      if primary_item_id
        @spend.update!(spend_params.merge(primary_item_list_id: primary_item_id))
      else
        @spend.update!(spend_params)
      end
      flash[:success] = '保存しました。'
      redirect_to spends_path
    rescue StandardError
      flash.now[:danger] = @spend.error_message
      @primaryitemlists = PrimaryItemList.initial_and_useroriginal(current_user.id)
      render :edit
    end
  end

  def destroy
    @spend = Spend.find(params[:id])
    @spend.destroy
    flash[:success] = '削除しました。'
    redirect_to spends_path
  end

  private

  def spend_params
    params.require(:spend).permit(:primary_item, :content, :price, :user_id, :primary_item_list_id)
  end

  # before_action

  def edit_permission_check
    return if current_user.spends.find_by(id: params[:id])
    flash[:success] = '無効なURLです。'
    redirect_to root_path
  end
end
