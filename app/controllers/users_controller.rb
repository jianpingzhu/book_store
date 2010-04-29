class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :index]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  before_filter :signedin_user,:only => [:create, :new]

  def new
    @title = "Sign Up"
    @new_user = User.new
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    @new_user = User.new(params[:user])
    if @new_user.save
      sign_in @new_user
      flash[:success] = "Welcome to the Sample App " + @new_user.name + "!"
      redirect_to @new_user
    else
      @title = "Sign Up"
      @new_user.password = ''
      @new_user.password_confirmation = ''
      render 'new'
    end
  end

  def edit
    @title = "Edit User"
  end

  def update 
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit User"
      render 'edit'
    end
  end

  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page])
  end

  def destroy
    user = User.find(params[:id])
    if user.admin?
      flash[:error] = "Cannot delete admin users!"
      redirect_to users_path 
    else
      user.destroy
      flash[:success] = "User destroyed."
      redirect_to users_path   
    end
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      if signed_in?
        redirect_to(root_path) unless (current_user.admin?)
      else
        redirect_to signin_path
      end 
    end

    def signedin_user
      redirect_to root_path if signed_in?
    end
end
