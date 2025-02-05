class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
      @user = current_user
  end

  def edit
      @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: "User profile was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
      def user_params
          params.require(:user).permit(:first_name, :last_name, :username, :county, :bio, :email)
      end
end
