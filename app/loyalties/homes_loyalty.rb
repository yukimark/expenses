class HomesLoyalty < ApplicationLoyalty

  def index?
    user.present?
  end
end
