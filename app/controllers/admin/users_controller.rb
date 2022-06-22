class Admin::UsersController < AdminController
  before_action :get_user, only: [:show, :update, :destroy, :edit]
  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 5).order('created_at desc')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to admin_users_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    if @user.present? && !@user.admin?
      @user.destroy
      flash[:success] = "User destroyed."
    else
      flash[:error] = "Can not delete account!"
    end
    redirect_to admin_users_url
  end

  private

  def get_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
  params.require(:user).permit(:name, :email, :role, :phone, :password, :password_confirmation ) 
  end
end
