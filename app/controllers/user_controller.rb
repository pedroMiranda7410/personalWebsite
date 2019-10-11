class UserController < ApplicationController

  #https://github.com/user.png


  def dashboard
    if current_user != nil
      if current_user.admin == true
        render :layout => false
      end
    else
      redirect_to login_path
    end
  end 


  def layout_dashboard
    @url = request.original_fullpath.gsub( /[\?#].*|$/, "")
    @created = params[:created]
    @updated = params[:updated]

    if @created == true || @created == "true"
      @created = true
    else
      @created = false 
    end

    if @updated == true || @updated == "true"
      @updated = true
    else
      @updated = false 
    end


    if current_user != nil
      if current_user.admin == true
        render :layout => false
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
        format.html { redirect_to login_path(first_time: true), notice: 'user was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_summary
    @summary = Summary.find_by_id(params[:summary_id])

    respond_to do |format|
      if @summary.update(summary_params)
        format.html { redirect_to root_path, notice: 'Sumário salvo com sucesso!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @nuser.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_objective
    @objective = MyObjective.find_by_id(params[:objective_id])

    respond_to do |format|
      if @objective.update(my_objective_params)
        format.html { redirect_to root_path, notice: 'Objetivo salvo com sucesso!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @nuser.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @user = User.find_by_id(params[:user_id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_list_users_path, notice: 'Usuário foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  def login_count
    @user = User.find_by_id(current_user.id)
  end

  def update
    @user = User.find_by_id(current_user.id)
    @login_counter = params[:login_counter]
    @tamoJunto_counter = params[:tamoJunto]
    @euQuemAgradeco_counter = params[:euQuemAgradeco]
    @notification = params[:notification]

    if @login_counter == "true"
      @total = @user.login_count + 1
      @user.update(login_count: @total)
    end

    if @tamoJunto_counter == "true"
      @user.update(tamo_junto: 1, first_time: false)
    end

    if @euQuemAgradeco_counter == "true"
      @user.update(eu_quem_agradeco: 1, first_time: false)
    end

    if @notification == "true"
      @user.update(show_notification: (@user.show_notification ? false : true))
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'Mudanças salvas com sucesso!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:background_image_choose,:filter,:backgroung_image_display,:show_notification,:name,:github, :nickname, :email, :password, :admin, :avatar, :login_count, :first_time,:tamo_junto,:eu_quem_agradeco)
    end

    def summary_params
      params.require(:summary).permit(:description)
    end

    def my_objective_params
      params.require(:my_objective).permit(:description)
    end
end
