class Admin::UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy, :edit]

  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 3).order('created_at desc')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_url
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
  params.require(:user).permit(:name, :email, :role, :phone, :password, :password_confirmation ) 
  end
end
