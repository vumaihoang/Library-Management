class Admin::PublishersController < ApplicationController
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
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def edit
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update(publisher_params)
      flash[:success] = "Publisher updated"
      redirect_to admin_publishers_path
    else
      render 'edit'
    end
  end

  def destroy
    Publisher.find(params[:id]).destroy
    flash[:success] = "Publisher deleted"
    redirect_to admin_publishers_url
  end

  private

  def get_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name, :address)
  end
end
