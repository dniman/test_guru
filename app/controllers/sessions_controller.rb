class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      
      redirect_to cookies[:current_path] || tests_path      
      
      cookies[:email] = current_user&.email
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    @current_user = nil
    session.clear 
    redirect_to root_path
  end
end
