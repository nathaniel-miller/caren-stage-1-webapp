class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.references :role, foreign_key: true
      t.references :circle, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
