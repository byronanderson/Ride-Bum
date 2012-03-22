class Invitation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  accepts_nested_attributes_for :user
  scope :unsent, where(email_sent: false)
  def send_email
    Notifier.invitation(self).deliver!
  end
end
