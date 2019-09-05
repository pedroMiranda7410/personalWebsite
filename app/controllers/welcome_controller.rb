class WelcomeController < ApplicationController

  def index
    @first_time = params[:first_time] != nil ? (params[:first_time] == "true" || params[:first_time] == true ? true : false)  : false
  end

  def sotware

  end

  def eletronica

  end

  def fluxo_sanguineo

  end

  def projeto_icf

  end

end
