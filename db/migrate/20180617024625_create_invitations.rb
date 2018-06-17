class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.boolean :accepted
      t.boolean :reject
      t.int :position_id
      t.int :sender_id
      t.string :email

      t.timestamps
    end
  end
end
