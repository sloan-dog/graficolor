class AddPaintsToPalettes < ActiveRecord::Migration
  def change
    add_column :palettes, :paints, :string
  end
end
