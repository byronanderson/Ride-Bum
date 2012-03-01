class AddEmailSentBooleanToInvitationsTable < ActiveRecord::Migration
  def change
    add_column :invitations, :email_sent, :boolean, default: false
  end
end
