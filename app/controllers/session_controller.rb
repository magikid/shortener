class SessionController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    auth = request.env["omniauth.auth"]

    if user_authorized(auth.extra.raw_info.login)
      user = User.from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to sites_url, notice: "Signed in!"
    else
      redirect_to root_path, alert: "Only authorized members can use this server"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  private

  def user_authorized(user)
    authorized_users = YAML.load_file("#{Rails.root.to_s}/config/authorized_user.yml")
    authorized_users.include? user
  end
end
