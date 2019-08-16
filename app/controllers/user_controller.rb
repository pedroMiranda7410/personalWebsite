class UserController < ApplicationController
  before_action :authenticate

  def dashboard
    if current_user.admin == true

    end
  end

  def edit
    @user = User.find_by_id(current_user.id)
  end

  def update
    @user = User.find_by_id(current_user.id)
    if current_user.admin != true
      current_user.admin  = false
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'Mudanças salvas com sucesso!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @nuser.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :password, :admin, :avatar)
    end
end
