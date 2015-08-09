class UserMailer < ActionMailer::Base
  default :from=>'wandplatypus@hotmail.com'

  def registration_confirmation(user)
    mail(:to=>'turquoisestripedcarrot@gmail.com', :subject =>'registered')

  end
  def send_stuffs(user)

  end
end
