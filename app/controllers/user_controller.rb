class UserController < ApplicationController

  #https://github.com/user.png


  def dashboard
    if current_user != nil
      @bgDisplay = params[:bgDisplay]
      @bgImage = params[:bgImage]
      @bgColor = params[:bgColor]
      @notification = params[:notification]

      @notification = @notification == "true" ? true : false

      if @bgDisplay == "true" || @bgDisplay == true
        @bgDisplay = true
      else
        @bgDisplay = false
      end

      if @bgColor == "true" || @bgColor == true
        @bgColor = true
      else
        @bgColor = false
      end

      if @bgImage == "true" || @bgImage == true
        @bgImage = true
      else
        @bgImage = false
      end

      if current_user.admin == true
        
      end
      render :layout => false
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
        
      end
      render :layout => false
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

  def update_community
    @community = Community.find_by_id(params[:community_id])

    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to root_path, notice: 'Comunidade salva com sucesso!' }
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

  def delete_post
    @post = Post.find_by_id(params[:post_id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_list_users_path, notice: 'Postagem foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  def delete_project
    @project = Project.find_by_id(params[:project_id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_list_users_path, notice: 'Projeto foi excluído com sucesso.' }
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
    @bgDisplay = params[:bgDisplay]
    @bgColor = params[:bgColor]
    @bgImage = params[:bgImage]

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

    if @bgColor == "true"
      @colorValue = params[:colorValue]

      if @colorValue == 'black'
        respond_to do |format|
          if @user.update_attributes(bgColor: 0)
            format.html { redirect_to dashboard_path(bgColor: true), notice: 'Mudanças salvas com sucesso!' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end 
      elsif @colorValue == 'azure'
        respond_to do |format|
          if @user.update_attributes(bgColor: 1)
            format.html { redirect_to dashboard_path(bgColor: true), notice: 'Mudanças salvas com sucesso!' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end 
      elsif @colorValue == 'green'
        respond_to do |format|
          if @user.update_attributes(bgColor: 2)
            format.html { redirect_to dashboard_path(bgColor: true), notice: 'Mudanças salvas com sucesso!' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end 
      elsif @colorValue == 'orange'
        respond_to do |format|
          if @user.update_attributes(bgColor: 3)
            format.html { redirect_to dashboard_path(bgColor: true), notice: 'Mudanças salvas com sucesso!' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end 
      elsif @colorValue == 'red'
        respond_to do |format|
          if @user.update_attributes(bgColor: 4)
            format.html { redirect_to dashboard_path(bgColor: true), notice: 'Mudanças salvas com sucesso!' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end 
      elsif @colorValue == 'purple'
        respond_to do |format|
          if @user.update_attributes(bgColor: 5)
            format.html { redirect_to dashboard_path(bgColor: true), notice: 'Mudanças salvas com sucesso!' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end 
      end
    else

      if @bgDisplay == "true"
        respond_to do |format|
          if @user.update_attributes(background_image_display: (@user.background_image_display ? false : true))
            format.html { redirect_to dashboard_path(bgDisplay: true), notice: 'Mudanças salvas com sucesso!' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end      
      elsif @bgImage == "true"
        @imageValue = params[:imageValue]
        @choosen = 0
        if @imageValue == "image-0"
          @choosen = 0
        elsif @imageValue == "image-1"
          @choosen = 1
        elsif @imageValue == "image-2"
          @choosen = 2
        elsif @imageValue == "image-3"
          @choosen = 3
        elsif @imageValue == "image-4"
          @choosen = 4 
        elsif @imageValue == "image-5"
          @choosen = 5   
        elsif @imageValue == "image-6"
          @choosen = 6        
        end
        respond_to do |format|
          if @user.update_attributes(background_image_choose: @choosen)
            format.html { redirect_to dashboard_path(bgImage: true), notice: 'Mudanças salvas com sucesso!' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|

          if @user.admin == false
            @bool_falsingAdmin = true
          end

          if @user.update(user_params)
            if @bool_falsingAdmin
              @user.update_attribute(:admin, false)
            end
            
            format.html { redirect_to (@notification == "true" ? dashboard_path(notification: true) : dashboard_edit_user_path), notice: 'Mudanças salvas com sucesso!' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

    end
  end

  private
    def user_params
      params.require(:user).permit(:favorite_language, :background_image_choose,:bgColor,:background_image_display,:show_notification,:name,:github, :nickname, :email, :password, :admin, :avatar, :login_count, :first_time,:tamo_junto,:eu_quem_agradeco)
    end

    def summary_params
      params.require(:summary).permit(:description)
    end

    def my_objective_params
      params.require(:my_objective).permit(:description)
    end

    def community_params
      params.require(:community).permit(:description)
    end
end
