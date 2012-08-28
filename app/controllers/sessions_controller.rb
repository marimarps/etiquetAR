class SessionsController < ApplicationController
 
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      # Once the user has login correctly, s/he is automatically redirected to home_user
      #render 'static_pages/home_signed_in'
      redirect_to current_user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
