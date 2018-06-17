class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :description
      t.integer :created_by
      t.boolean :medical

      t.timestamps
    end
  end
end
