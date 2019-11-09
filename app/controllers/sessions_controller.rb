class SessionsController < ApplicationController

  def create

    user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_path(loged: true), notice: 'Conectado com sucesso!'
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
