class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_profile_path(@user), notice: 'User updated successfully.'
    else
      render :edit
    end
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
