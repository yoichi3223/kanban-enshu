class UserController < ApplicationController
  before_action:set_user, only: %i(edit update)

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
