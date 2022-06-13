class BooksController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @books  =  @q.result.paginate(:page => params[:page], :per_page => 3)
    @cart = current_cart
  end

  def show
    if (Book.find_by id: params[:id]).nil?
      flash[:danger] = "Không Tồn Tại Sách!"
      redirect_to root_path
    else
      @book = Book.find_by id: params[:id]
      @authors = @book&.authors
      @publishers = @book&.publishers
    end
  end
end
