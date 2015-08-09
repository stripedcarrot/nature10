class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    user= [:email=>current_user.email, :name=>current_user.email]
    UserMailer.registration_confirmation(user).deliver
    #UserMailer.registration_confirmation(user).deliver
  end
end
