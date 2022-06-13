OrderService < ApplicationService
  def initilize params
    @start_date = params[:start_date]
  end

  def build_order
    Order.create(
      start_date: params[:start_date],
      end_date: 
    )
  end
end
