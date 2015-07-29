class FixPaintsInPalettes < ActiveRecord::Migration
  def change
    rename_column :palettes, :paints, :paintchoices
  end
end
