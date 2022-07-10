class PrimaryItemListsLoyalty < ApplicationLoyalty
  def edit?
    user.id == record.user_id
  end

  def update?
    user.id == record.user_id
  end

  def destroy?
    user.id == record.user_id && record.initial_flag == false
  end
end
