class ApplicationController < ActionController::Base
  def logged_in_user
    redirect_to new_user_session_path, notice: 'ログインが必要です。' unless user_signed_in?
  end

  def transition_error
    flash[:notice] = '無効なURLです。'
    redirect_to root_path
  end

  def current_primary_item_lists
    @_current_primary_item_lists ||= current_user.primary_item_lists
  end

  def current_spends
    @_current_spends ||= current_user.spends
  end
end
