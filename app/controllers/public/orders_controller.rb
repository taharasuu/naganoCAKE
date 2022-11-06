class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @cart_items = current_customer.cart_items
    address_method = (params[:address_method])
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @sum = 0
    
    if address_method == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif address_method == "1"
      @address = Address.find(params[:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end

  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save

    cart_items = CartItem.all


    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_id = cart_item.item.id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.making_status = "impossible"
      order_detail.save
      cart_item.destroy
    end

    redirect_to public_orders_confirm_path
  end

  def confirm

  end

  def index
    @orders = current_customer.orders.all

  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

    def order_params
        params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
    end

    def order_detail_params
        params.require(:order_detail).permit(:price, :amount, :name, :making_status)
    end

end
