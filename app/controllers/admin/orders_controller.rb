class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.shipping_cost = 800
    @sum = 0
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to public_orders_confirm_path
  end

   private

    def order_params
        params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :customer_id )
    end

end
