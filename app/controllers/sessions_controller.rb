class SessionsController < ApplicationController
  def new;  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      flash[:success] = 'Login success'
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    log_out if log_in?
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
