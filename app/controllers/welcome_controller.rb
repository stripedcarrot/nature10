class WelcomeController < ApplicationController
  def create
    UserMailer.registration_confirmation(@user).deliver
  end
end
