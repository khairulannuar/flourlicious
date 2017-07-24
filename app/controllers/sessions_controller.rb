class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
