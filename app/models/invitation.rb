class Invitation < ActiveRecord::Base
  belongs_to :event
  scope :unsent, where(email_sent: false)
  def send_email
    Notifier.invitation(self).deliver!
  end
end
