class ProjectController < ApplicationController

    def create
      @project = Project.new(project_params)
  
  
      respond_to do |format|
        if @project.save
          format.html { redirect_to dashboard_projects_path(notify: true), notice: 'project was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      def project_params
        params.require(:project).permit(:title,:objective, :description, :language, :pdf, :readme, :video, :photo, :summary_file_zip,:files_zip,:github_link, :principal)
      end
  end
  