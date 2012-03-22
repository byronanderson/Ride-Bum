class MoveInviteesToUsers < ActiveRecord::Migration
  def up
    remove_column :invitations, :invitee_phone
    remove_column :invitations, :invitee_email
    remove_column :invitations, :invitee_name
    add_column    :invitations, :user_id, :integer
    add_column    :users,       :phone,   :string
  end

  def down
    add_column :invitations, :invitee_phone, :string
    add_column :invitations, :invitee_email, :string
    add_column :invitations, :invitee_name, :string
    remove_column :invitations, :user_id
    remove_column :users,       :phone
  end
end
