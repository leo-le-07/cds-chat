class SessionController < ApplicationController
  before_action :deny_signned_in_user, only: [:new, :create, :index]

  def new
  end

  def create
    user = User.login(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Your email or password is not correct"
      render 'new'
    end
  end

  def index
  end

  def destroy
    session[:user_id] = nil
    render 'new'
  end
end
