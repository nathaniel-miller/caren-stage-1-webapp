class CreateTaskGenerators < ActiveRecord::Migration[5.2]
  def change
    create_table :task_generators do |t|
      t.text :description, null: false
      t.references :category, foreign_key: true
      t.references :circle, foreign_key: true
      t.integer :created_by_id
      t.boolean :mandatory, default: false
      t.integer :every_n, default: 1
      t.boolean :sun, default: false 
      t.boolean :mon, default: false
      t.boolean :tues, default: false
      t.boolean :wed, default: false
      t.boolean :thurs, default: false
      t.boolean :fri, default: false
      t.boolean :sat, default: false
      t.integer :part_of_day, default: 1
      t.time :custom_time
      t.timestamp :last_run
      t.integer :look_ahead, default: 7

      t.timestamps
    end

    add_foreign_key :task_generators, :users, column: :created_by_id
  end
end
