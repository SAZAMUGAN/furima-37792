class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save 
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end

  end

  private
  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_shipping_address).permit(:post_code, :ken_name_id, :city_name, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id, token: params[:token])
  end


  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
