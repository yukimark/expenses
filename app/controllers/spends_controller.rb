class SpendsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_permission_check, only: %i[edit update destroy]

  def index
    @spends = current_user.spends.order(created_at: :desc)
    @spend = current_user.spends.new
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
      render :index
    end
  end

  def edit
    @spend = Spend.find(params[:id])
  end

  def update
    @spend = Spend.find(params[:id])
    begin
      @spend.update!(spend_params)
      flash[:success] = '保存しました。'
      redirect_to spends_path
    rescue StandardError
      flash.now[:danger] = @spend.error_message
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
    params.require(:spend).permit(:primary_item, :secondary_item, :content, :price, :memo, :user_id)
  end

  # before_action

  def edit_permission_check
    return if current_user.spends.find_by(id: params[:id])
    flash[:success] = '無効なURLです。'
    redirect_to spends_path
  end
end
