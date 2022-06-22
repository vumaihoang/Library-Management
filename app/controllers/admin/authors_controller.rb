class Admin::AuthorsController < AdminController
  before_action :get_author, only: [:show, :update, :destroy, :edit]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author successfully created"
      redirect_to admin_authors_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @author.update(author_params)
      flash[:success] = "Author updated"
      redirect_to admin_authors_path
    else
      render 'edit'
    end
  end

  def destroy
    if @author.present?
      @author.destroy
      flash[:success] = "Author deleted"
    else
      flash[:error] = "Can not delete author!"
    end
    redirect_to admin_authors_url
  end

  private

  def get_author
    @author = Author.find_by(id: params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :country, :age)
  end
end
