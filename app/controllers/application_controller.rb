class ApplicationController < ActionController::Base
  helper_method :current_user

  add_flash_types :danger, :success, :info, :warning

  def new

    if User.all == []
      @admin = User.new(password:"123",name: "Pedro Miranda", admin: true, github: 'pedroMiranda7410' ,nickname:"pedro.jams", email:"pmiranda7410@gmail.com", avatar: "")
      @admin.save
    end

    session[:user_id] = nil
  end

  def current_user

    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end

  end


  def authenticate

      redirect_to(login_path) unless current_user

  end

end
