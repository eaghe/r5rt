class SessionsController < ApplicationController
  def new
  end

  def create
    auth = params[:session]
    user = User.find_by(email: auth[:email].downcase)
    if user && user.authenticate(auth[:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
