class ApplicationController < ActionController::Base
  def logged_in_user
    redirect_to new_user_session_path, notice: 'ログインが必要です。' unless user_signed_in?
  end

end
