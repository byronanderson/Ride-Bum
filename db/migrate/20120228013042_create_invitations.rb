class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :invitee_name
      t.string :invitee_email
      t.string :invitee_phone
      t.integer :event_id

      t.timestamps
    end
  end
end
