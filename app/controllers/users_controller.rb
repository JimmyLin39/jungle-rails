class UsersController < ApplicationController
  def index
    # @users = User.where(user_param.email == User.email, user_param.password == User.password )
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_param)
    
    if @user.save
      redirect_to [:products], notice: 'Account created!'
    else
      render :new
    end
  end

  def user_param
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end
end
