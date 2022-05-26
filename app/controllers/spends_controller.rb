class SpendsController < ApplicationController
  def index
    @spends = Spend.all.order(created_at: :desc)
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
      @spends = Spend.all.order(created_at: :desc)
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
end
