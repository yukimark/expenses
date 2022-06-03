class PrimaryItemListsController < ApplicationController
  def index
    @PrimaryItemLists  = PrimaryItemList.all
  end

  def create
  end

  def destroy
  end

  def update
  end

  def edit
  end
end
