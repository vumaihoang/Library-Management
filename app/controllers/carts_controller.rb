class CartsController < ApplicationController
  def show
    @cart = Cart.find_by(id: params[:id])
    line_items = @cart.line_items
    @line_items = line_items.with_status
    @quantity = @line_items.pluck(:quantity).sum
  end

  def destroy
    @cart = current_cart
    line_items = @cart.line_items.with_status
    line_items.delete_all
    flash[:success] = "Cart clear!"
    redirect_to cart_url
  end

  def index
    @carts = []
    if session[:cart_id] != nil
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end
end
