class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.boolean :accepted
      t.boolean :reject
      t.integer :position_id
      t.integer :sender_id
      t.string :email

      t.timestamps
    end
  end
end
