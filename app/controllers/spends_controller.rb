class SpendsController < ApplicationController

  def index 
    @spends = Spend.all.order(created_at: :desc)
    @spend = Spend.new
  end

  def create 
    @spend = Spend.new(spend_params)
    begin
      @spend.save!
      redirect_to action: 'index'
      flash[:success] = '保存しました。'
    rescue
      flash.now[:danger] = @spend.error_message
      @spends = Spend.all.order(created_at: :desc)
      render :index
    end
  end

  private
    def spend_params
      params.require(:spend).permit(:b_item, :c_item, :content, :price, :memo, :user_id)
    end
end
