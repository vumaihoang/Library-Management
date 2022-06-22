class AdminController < ActionController::Base
  before_action :set_admin

  def set_admin
    unless current_user.admin?
      flash[:error] = "No rights to use"
      redirect_to books_path
    end
  end
end

  private

  def current_cart
    Cart.find_by(user_id: current_user.id)
  end
