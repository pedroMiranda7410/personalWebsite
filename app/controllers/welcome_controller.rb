class WelcomeController < ApplicationController

  def index
    @first_time = params[:first_time] != nil ? params[:first_time] : false
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
