class UserController < ApplicationController

  #https://github.com/user.png

  def dashboard
    if current_user != nil
      if current_user.admin == true

      end
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)


    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'user was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find_by_id(current_user.id)
  end

  def update
    @user = User.find_by_id(current_user.id)

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
      params.require(:user).permit(:name,:github, :nickname, :email, :password, :admin, :avatar)
    end
end
