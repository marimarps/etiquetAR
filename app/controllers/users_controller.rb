class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @qrs = current_user.qrs
    @profiles = current_user.profiles

    @new_profile = Profile.new
    @new_profile.user = current_user
  end

  def new
  	  @user = User.new
  end


  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end


  # PUT /users/1
  # PUT /users/1.json
  def update
      @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
        sign_in @user
        flash[:success] = "User updated!"
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to etiquetAR!"
      #FUNCIONA PERO REDIRECCIONA A USER/show: 
      redirect_to @user
    else
      render 'new'
    end
  end

  def download_qr

  end

  def qr_resource

  end


end
