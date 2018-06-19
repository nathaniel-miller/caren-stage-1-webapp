class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.integer :super_admin_id

      t.timestamps
    end

    add_foreign_key :circles, :users, column: :super_admin_id
  end
end
