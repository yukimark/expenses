class SpendsController < ApplicationController
  before_action :logged_in_user
  before_action :edit_permission_check, only: %i[edit update destroy]

  def index
    primary_item_list_id = primary_item_list_id_default
    @spends = current_spends.order(created_at: :desc)
    @spend = current_spends.new(primary_item_list_id: primary_item_list_id)
    @primaryitemlists = current_primary_item_lists.order(:id)
  end

  def create
    @spend = current_spends.new(spend_params)
    begin
      @spend.save!
      redirect_to spends_path, flash: { success: '保存しました。' }
    rescue StandardError
      @spends = current_spends.order(created_at: :desc)
      @primaryitemlists = current_primary_item_lists.order(:id)
      flash.now[:danger] = @spend.error_message
      render :index
    end
  end

  def edit
    @spend = Spend.find(params[:id])
    @spend.primary_item_list_id ||= primary_item_list_id_default
    @primaryitemlists = current_primary_item_lists.order(:id)
  end

  def update
    @spend = Spend.find(params[:id])
    begin
      @spend.update!(spend_params)
      redirect_to spends_path, flash: { success: '更新しました。' }
    rescue StandardError
      @primaryitemlists = current_primary_item_lists.order(:id)
      flash.now[:danger] = @spend.error_message
      render :edit
    end
  end

  def destroy
    @spend = Spend.find(params[:id])
    @spend.destroy
    redirect_to spends_path, flash: { success: '削除しました。' }
  end

  private

  def spend_params
    params.require(:spend).permit(:content, :price, :primary_item_list_id, :user_id)
  end

  def primary_item_list_id_default
    return current_primary_item_lists.find_by(name: '未分類').id
  end

  # before_action

  def edit_permission_check
    transition_error if current_spends.find_by(id: params[:id]).blank?
  end
end
