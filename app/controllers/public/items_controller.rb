class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

   private

    def item_params
        params.require(:item).permit(:name, :price, :introduction, :image)
    end
    def cart_item_params
        params.require(:cart_item).permit(:amount)
    end
end
