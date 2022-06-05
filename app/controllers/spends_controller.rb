class SpendsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_permission_check, only: %i[edit update destroy]

  PRIMARY_ITEM_LIST_ID_INITIAL_MAX = 18

  def index
    @spends = current_user.spends.order(created_at: :desc)
    @spend = current_user.spends.new
    @primaryitemlists = PrimaryItemList.where(user_id: current_user.id).or(PrimaryItemList.where(initial_value: true)).order(:id)
  end

  def create
    primary_item_id = PrimaryItemList.find_by(primary_item: params[:spend][:primary_item]).id 
    if primary_item_id > PRIMARY_ITEM_LIST_ID_INITIAL_MAX
      primary_item_id = PrimaryItemList.find_by(primary_item: params[:spend][:primary_item], user_id: current_user.id).id
    end
    @spend = current_user.spends.new(spend_params.merge(primary_item_id: primary_item_id))
    begin
      @spend.save!
      flash[:success] = '保存しました。'
      redirect_to action: 'index'
    rescue StandardError
      flash.now[:danger] = @spend.error_message
      @spends = current_user.spends.order(created_at: :desc)
      @primaryitemlists = PrimaryItemList.where(user_id: current_user.id).or(PrimaryItemList.where(initial_value: true)).order(:id)
      render :index
    end
  end

  def edit
    @spend = Spend.find(params[:id])
    @primaryitemlists = PrimaryItemList.where(user_id: current_user.id).or(PrimaryItemList.where(initial_value: true)).order(:id)
  end

  def update
    primary_item_id = PrimaryItemList.find_by(primary_item: params[:spend][:primary_item]).id
    if primary_item_id > PRIMARY_ITEM_LIST_ID_INITIAL_MAX
      primary_item_id = PrimaryItemList.find_by(primary_item: params[:spend][:primary_item], user_id: current_user.id).id
    end
    @spend = Spend.find(params[:id])
    begin
      @spend.update!(spend_params.merge(primary_item_id: primary_item_id))
      flash[:success] = '保存しました。'
      redirect_to spends_path
    rescue StandardError
      flash.now[:danger] = @spend.error_message
      @primaryitemlists = PrimaryItemList.where(user_id: current_user.id).or(PrimaryItemList.where(initial_value: true)).order(:id)
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
    params.require(:spend).permit(:primary_item, :secondary_item, :content, :price, :memo, :user_id, :primary_item_id)
  end

  # before_action

  def edit_permission_check
    return if current_user.spends.find_by(id: params[:id])
    flash[:success] = '無効なURLです。'
    redirect_to root_path
  end
end
