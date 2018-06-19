class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.datetime :expiration_date
      t.boolean :completed, default: false
      t.integer :completed_by_id
      t.integer :created_by_id
      t.references :category, foreign_key: true
      t.references :task_generator, foreign_key: true
      t.references :circle, foreign_key: true

      t.timestamps
    end

    add_foreign_key :tasks, :users, column: :created_by_id
    add_foreign_key :tasks, :users, column: :completed_by_id
  end
end
