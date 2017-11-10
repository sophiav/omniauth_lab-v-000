class SessionsController < ApplicationController
  def new
  end

  # def create
  #   @user = User.find_or_create_by(uid: auth[:uid]) do |u|
  #     u.name = auth['info']['name']
  #     u.email = auth['info']['email']
  #   end

  #   session[:user_id] = @user.id
  #   render 'welcome/home'
  # end

  # private
  # def auth
  #   request.env['omniauth.auth']
  # end


  def create
    auth_hash = request.env["omniauth.auth"]
    @user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
      u.name = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
    end

    session[:user_id] = @user.id
    render 'welcome/home'
  end

end