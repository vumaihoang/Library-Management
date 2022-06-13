class OrdersController < ApplicationController
	def index
    @orders = Order.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @cart = current_cart.line_items
    if current_user&.admin?
      @orders = Order.all
    else
      @orders = current_cart.order.where(status: "Đang Giao")
    end
  end

  def active
    order = Order.find params[:order_id]
    order.update(status: "Đã Giao")
    redirect_to orders_path
    flash[:success] = "Active Success!"
  end

	def new
		@order = Order.new
	end

	def create
		@orders = current_cart.order.build order_params
		if @orders.save
			flash[:success] = "Create order success!"
			redirect_to books_url
		else
			render :new
		end
	end

	def show
    @cart = current_cart.line_items
    if current_user&.admin?
      @orders_active = Order.all
    else
      @orders_active = current_cart.order.where(status: "Đã Giao")
    end
  end


	private

	def order_params
		params.require(:order).permit(:name, :email, :address)
	end
end
