class CreatePaintsPalettes < ActiveRecord::Migration
  def change
    create_table :paints_palettes do |t|
      t.references :paint, index: true, foreign_key: true
      t.references :palette, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
