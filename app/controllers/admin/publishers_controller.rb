class Admin::PublishersController < AdminController
  before_action :get_publisher, only: [:show, :update, :destroy, :edit]

  def index
    @publishers = Publisher.all
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:success] = "Publisher successfully created"
      redirect_to admin_publishers_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params)
      flash[:success] = "Publisher updated"
      redirect_to admin_publishers_path
    else
      render 'edit'
    end
  end

  def destroy
    if @publisher.present?
      @publisher.destroy
      flash[:success] = "Publisher deleted"
    else
      flash[:error] = "Can not delete publisher!"
    end
    redirect_to admin_publishers_url
  end

  private

  def get_publisher
    @publisher = Publisher.find_by(id: params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name, :address)
  end
end
