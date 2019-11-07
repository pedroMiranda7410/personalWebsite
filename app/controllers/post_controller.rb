
class PostController < ApplicationController

    def show
      @post = Post.find_by_id(params[:post_id])
    end

    def update
      @post = Post.find_by_id(params[:post_id])

      respond_to do |format|
        if @post.update(post_params)
            if current_user.admin == false
                @post.update_attribute(:admin_verification, false)
            end 
          format.html { redirect_to dashboard_posts_path(updated: true), notice: 'Mudanças salvas com sucesso!' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
      @post = Post.new(post_params)
      @created = params[:created]

      if @created == true || @created == "true"
        @created = true
      end
  
      respond_to do |format|
        if @post.save
          format.html { redirect_to dashboard_posts_path(created: true), notice: 'Post was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
    
    private
      def post_params
        params.require(:post).permit(:principal_language,:likes, :admin_verification, :sub_description, :user_id,:get_from_github,:github_branch_name,:github_owner_name,:github_repo_name,:sub_title, :title,:objective, :description, :language, :pdf, :readme, :video, :image, :summary_file_zip,:files_zip, :principal)
      end
  end