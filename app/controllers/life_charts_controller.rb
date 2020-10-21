class LifeChartsController < ApplicationController

  def index
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.nickname = "Guest"
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
    sign_in user
    redirect_to root_path
  end
end
