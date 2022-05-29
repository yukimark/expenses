class SpendsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_can_user, only: %i[edit update destroy]

  def index
    # UserとSpendを紐づけてcurrent_user.spendsにした方がわかりやすそうです
    @spends = Spend.where(user_id: current_user.id).order(created_at: :desc)
    # current_user.spend.newにしておくと初期値でuser_idにcurrent_user.idが入ったりします
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
      @spends = Spend.where(user_id: current_user.id).order(created_at: :desc)
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

  # before_action

  # これは他のControllerでも使用しそうなのでApplicationControllerに書いた方が良さそうですね
  def logged_in_user
    redirect_to new_user_session_path unless user_signed_in?
  end

  # 今のメソッド名だとuserが返ってくるのかな？って思っちゃうのでedit_permission_check(これが正解とかではないです笑)等の方がいいかなと
  def edit_can_user
    # redirect_to spends_path unless current_user.spends.find_by(id: params[:id])の方がスムーズに書けそうです
    spend = Spend.find(params[:id])
    redirect_to spends_path if spend.user_id != current_user.id
  end
end
