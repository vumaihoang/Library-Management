class OrdersController < ApplicationController
	def index
    @orders = Order.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @cart = current_cart.line_items
    line_items = current_cart.line_items
    @book_titles = []
    line_items.each { |item| @book_titles << item.book.title }
    if current_user&.admin?
      @orders = @orders
    else
      @orders = current_cart.orders.where(status: "Đang Giao").paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    end
  end

  def active
    order = Order.find_by(id: params[:order_id])
    order.update(status: "Đã Giao")
    redirect_to orders_path
    flash[:success] = "Delivered Success!"
  end

	def new
		@order = Order.new
	end

	def create
		@orders = current_cart.orders.build order_params
    @cart = current_cart
    line_items = @cart.line_items
    @line_items = line_items.with_status
		if @orders.save
      @line_items.each do |line_item|
        if line_item.book.quantity > 0
          quantity = line_item.book.quantity - line_item.quantity
          if quantity <= 0
            line_item.book.quantity = 0
            line_item.book.role = "unavailable"
          end
        end
        line_item.book.update(quantity: quantity)
      end
      @line_items.update_all(status: true, order_id: @orders.id)
			flash[:success] = "Create order success!"
			redirect_to orders_path
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
