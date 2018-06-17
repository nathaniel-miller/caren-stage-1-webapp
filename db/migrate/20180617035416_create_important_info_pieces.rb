class CreateImportantInfoPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :important_info_pieces do |t|
      t.text :description
      t.string :category_id
      t.string :int
      t.int :created_by
      t.timestamp :created_at
      t.int :seen_by, array: true, default: []

      t.timestamps
    end
  end
end
