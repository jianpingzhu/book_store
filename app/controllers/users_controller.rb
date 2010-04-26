class UsersController < ApplicationController
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

end
