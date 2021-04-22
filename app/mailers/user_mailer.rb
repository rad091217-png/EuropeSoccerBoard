class UserMailer < ApplicationMailer
  default from: "@gmail.com"

  def account_activation(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Account Activation"
      ) do |format|
        format.text
      end
  end

  def password_reset
    @greeting = "こんにちは"

    mail to: "to@example.org"
  end
end
