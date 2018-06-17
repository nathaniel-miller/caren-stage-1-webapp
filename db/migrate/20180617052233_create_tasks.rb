class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :description
      t.datetime :expiration_date
      t.boolean :completed
      t.int :completed_by
      t.int :category_id
      t.int :created_by
      t.int :task_generator_id

      t.timestamps
    end
  end
end
