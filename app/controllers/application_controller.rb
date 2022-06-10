class ApplicationController < ActionController::Base
  def logged_in_user
    redirect_to new_user_session_path, notice: 'ログインが必要です。' unless user_signed_in?
  end

  def admin_user_rejection
    redirect_to root_path, flash: { alert: '許可されていない操作です。' } if current_user.admin == true
  end
end
