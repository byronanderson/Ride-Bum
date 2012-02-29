class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.invitation.subject
  #
  def invitation(invitation)
    @greeting = "Hi"

    mail to: invitation.invitee_email
  end
end
