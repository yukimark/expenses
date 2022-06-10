class HomesController < ApplicationController
  before_action :admin_user_rejection, only: %i[setting]

  def index; end

  def setting; end
end
