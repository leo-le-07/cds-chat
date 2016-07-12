class UsersController < ApplicationController
  before_action :deny_signned_in_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to incoming_messages_path
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
