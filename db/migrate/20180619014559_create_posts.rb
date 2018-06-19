class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :description, null: false
      t.references :circle, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :medical, default: false

      t.timestamps
    end
  end
end
