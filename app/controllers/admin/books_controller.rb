class Admin::BooksController < AdminController
  before_action :get_book, only: [:show, :update, :destroy, :edit]
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book successfully created"
      redirect_to books_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:success] = "Book updated"
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    if @book.present?
      @book.destroy
      flash[:success] = "Book deleted"
    else
      flash[:error] = "Can not delete book!"
    end
    redirect_to books_url
  end

  private

  def get_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :price, :image, :quantity, :user_id, :role, author_ids: [], publisher_ids: [],
      author_books_attributes: [:id, :book_id, :author_id],
      authors_attributes: [:id, :name, :country, :age],
      book_publishers_attributes: [:id, :book_id, :publisher_id],
      publishers_attributes: [:id, :name, :address]
    )
  end
end
