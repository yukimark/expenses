class SpendsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_can_user, only: [:edit, :update, :destroy]

  def index
    @spends = Spend.where(user_id:current_user.id).order(created_at: :desc)
    @spend = Spend.new
  end

  def create
    @spend = Spend.new(spend_params)
    begin
      @spend.save!
      flash[:success] = '保存しました。'
      redirect_to action: 'index'
    rescue StandardError
      flash.now[:danger] = @spend.error_message
      @spends = Spend.where(user_id:current_user.id).order(created_at: :desc)
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
    params.require(:spend).permit(:b_item, :c_item, :content, :price, :memo, :user_id)
  end

  #before_action

  def logged_in_user
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def edit_can_user
    spend = Spend.find(params[:id])
    if spend.user_id != current_user.id
      redirect_to spends_path
    end
  end
end
