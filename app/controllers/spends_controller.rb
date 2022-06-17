class SpendsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_permission_check, only: %i[edit update destroy]

  def index
    selected_default = current_user.primary_item_lists.find_by(name: '未分類', initial_flag: true).id
    @spends = current_user.spends.order(created_at: :desc)
    @spend = current_user.spends.new(primary_item_list_id: selected_default)
    @primaryitemlists = current_user.primary_item_lists.order(:id)
  end

  def create
    @spend = current_user.spends.new(spend_params)
    begin
      @spend.save!
      flash[:success] = '保存しました。'
      redirect_to action: 'index'
    rescue StandardError
      flash.now[:danger] = @spend.error_message
      @spends = current_user.spends.order(created_at: :desc)
      @primaryitemlists = current_user.primary_item_lists.order(:id)
      render :index
    end
  end

  def edit
    @spend = Spend.find(params[:id])
    @primaryitemlists = current_user.primary_item_lists.order(:id)
  end

  def update
    @spend = Spend.find(params[:id])
    begin
      @spend.update!(spend_params)
      flash[:success] = '保存しました。'
      redirect_to spends_path
    rescue StandardError
      flash.now[:danger] = @spend.error_message
      @primaryitemlists = current_user.primary_item_lists.order(:id)
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
    params.require(:spend).permit(:content, :price, :primary_item_list_id, :user_id)
  end

  # before_action

  def edit_permission_check
    transition_error if current_user.spends.find_by(id: params[:id]).blank?
  end
end
