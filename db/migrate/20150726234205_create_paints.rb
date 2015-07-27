class CreatePaints < ActiveRecord::Migration
  def change
    create_table :paints do |t|
      t.string :name
      t.string :component1
      t.string :component2
      t.string :component3
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
