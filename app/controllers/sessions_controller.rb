class SessionsController < ApplicationController

  def create

    user = User.find_by_nickname(params[:nickname])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          if user.admin == true
            redirect_to root_path, notice: 'Conectado com sucesso!'
          else
            redirect_to software_path, notice: 'Conectado com sucesso!'
          end
        else
          flash.now[:alert] = "Apelido/Senha inválido"
          render "new"
        end


  end

  def destroy

      session[:user_id] = nil

      redirect_to login_path, notice: "Desconectado com sucesso!"

  end
end
