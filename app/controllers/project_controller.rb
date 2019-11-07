class ProjectController < ApplicationController

    def show
      @project = Project.find_by_id(params[:project_id])
    end

    def update
      @project = Project.find_by_id(params[:project_id])

      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to dashboard_projects_path(updated: true), notice: 'Mudanças salvas com sucesso!' }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
      @project = Project.new(project_params)
      @created = params[:created]

      if @created == true || @created == "true"
        @created = true
      end
  
      respond_to do |format|
        if @project.save
          format.html { redirect_to dashboard_projects_path(created: true), notice: 'project was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
    
    private
      def project_params
        params.require(:project).permit(:principal_language, :sub_description, :user_id,:get_from_github,:github_branch_name,:github_owner_name,:github_repo_name,:sub_title, :title,:objective, :description, :language, :pdf, :readme, :video, :image, :summary_file_zip,:files_zip,:github_link, :principal)
      end
  end
  