class HomesController < ApplicationController
  before_action :admin_user_rejection, only: %i[index]
  
  def index; end

  def setting; end

  private

  def admin_user_rejection
    redirect_to destroy_user_session_path, method: :delete if current_user.admin?
  end
end
