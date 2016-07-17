class UsersController < ApplicationController
  before_action :deny_signned_in_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.where(email: user_params[:email], registered: false).first
    if @user
      byebug
      @user.name = user_params[:name]
      @user.password = user_params[:password]
      @user.registered = true
    else
      byebug
      @user = User.new(user_params)
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      render "new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
