class SessionsController < ApplicationController

  def create

    user = User.find_by_nickname(params[:nickname])

        if user && user.authenticate(params[:password])
          @first_time = params[:first_time] != nil ? params[:first_time] : params[:first_time]
          session[:user_id] = user.id
          redirect_to root_path(first_time: @first_time), notice: 'Conectado com sucesso!'
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
