class UsersController < ApplicationController

  before_action :logged_in_user, only:[:index,:edit,:destroy]
  before_action :correct_user, only:[:edit,:update,:destroy]

  #get users#new
  def new
    @user = User.new
    #form_for(@user)
  end

  #post users#new
  def create
    @user = User.new(user_params)
    if @user.save
      #success
      log_in @user
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_path
    else
      #failure
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end

  #get users
  def index
    @users = User.all
    #from_for @users
  end

  #get users#edit
  def edit
    @user = User.find(params[:id])
  end

  #post users#edit
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #post users#destroy
  def destroy

    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(
        :name, :email, :password,
        :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to users_path unless @user == @current_user
    end

    def admin_user
    end
end
