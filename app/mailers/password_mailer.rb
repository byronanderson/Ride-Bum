class PasswordMailer < ActionMailer::Base
  include Devise::Mailers::Helpers
  default from: "no_reply@blah.com"
  
  def confirmation_instructions(record)
    devise_mail(record, :confirmation_instructions)
  end

  def reset_password_instructions(record)
    devise_mail(record, :reset_password_instructions)
  end

  def unlock_instructions(record)
    devise_mail(record, :unlock_instructions)
  end
end
