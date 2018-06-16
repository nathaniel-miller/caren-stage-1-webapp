class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
  end
end
