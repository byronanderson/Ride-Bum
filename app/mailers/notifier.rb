class Notifier < ActionMailer::Base
  default from: "ridebum@therubyists.org"

  def invitation(invitation)
    @invitation = invitation

    mail to: invitation.user.email
  end
end
