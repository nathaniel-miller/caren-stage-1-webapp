class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.boolean :accepted, :default => false
      t.boolean :rejected, :default => false
      t.references :position, foreign_key: true
      t.integer :sender_id
      t.integer :recipient_id
      t.string :email, null: false

      t.timestamps
    end

    add_foreign_key :invitations, :users, column: :sender_id
    add_foreign_key :invitations, :users, column: :recipient_id
  end
end
