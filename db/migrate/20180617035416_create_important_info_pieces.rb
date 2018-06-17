class CreateImportantInfoPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :important_info_pieces do |t|
      t.text :description
      t.string :category_id
      t.string :int
      t.integer :created_by
      t.integer :seen_by, array: true, default: []

      t.timestamps
    end
  end
end
