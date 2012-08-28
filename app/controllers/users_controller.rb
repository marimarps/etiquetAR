class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  	  @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to etiquetAR!"
      #FUNCIONA PERO REDIRECCIONA A USER/show: 
      redirect_to @user
     # render 'static_pages/tagit'
    else
      render 'new'
    end
  end

end
