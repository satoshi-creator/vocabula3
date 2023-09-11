class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :term
      t.text :definition
      t.references :wordbook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
