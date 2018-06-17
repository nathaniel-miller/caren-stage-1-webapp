class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :description
      t.datetime :expiration_date
      t.boolean :completed
      t.integer :completed_by
      t.integer :category_id
      t.integer :created_by
      t.integer :task_generator_id

      t.timestamps
    end
  end
end
