class CreateTaskGenerators < ActiveRecord::Migration[5.2]
  def change
    create_table :task_generators do |t|
      t.text :description
      t.integer :category_id
      t.boolean :mandatory
      t.integer :every_n
      t.boolean :sun
      t.boolean :mon
      t.boolean :tues
      t.boolean :wed
      t.boolean :thurs
      t.boolean :fri
      t.boolean :sat
      t.integer :part_of_day
      t.time :custom_time
      t.timestamp :last_run
      t.integer :look_ahead

      t.timestamps
    end
  end
end
