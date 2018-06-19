class CreateImportantInfoPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :important_info_pieces do |t|
      t.text :description, null: false
      t.references :category, foreign_key: true
      t.references :circle, foreign_key: true
      t.integer :created_by_id
      t.integer :seen_by, array: true, default: []

      t.timestamps
    end

    add_foreign_key :important_info_pieces, :users, column: :created_by_id
  end
end
