class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def index
    if params[:search].present?
      @users = User.where("name LIKE ? OR email LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @users = User.all
    end
  end

  def home
    @users = User.order(created_at: :desc).limit(4)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @users = User.all
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end


end
