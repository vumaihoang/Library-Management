class Admin::BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :price, :image, :user_id, :role, author_ids: [], publisher_ids: [],
      author_books_attributes: [:id, :book_id, :author_id],
      authors_attributes: [:id, :name, :country, :age],
      book_publishers_attributes: [:id, :book_id, :publisher_id],
      publishers_attributes: [:id, :name, :address]
    )
  end
end
