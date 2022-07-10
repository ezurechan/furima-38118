class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create    
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if  @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
      #redirect_to item_orders_path
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
