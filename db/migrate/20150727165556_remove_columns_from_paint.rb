class RemoveColumnsFromPaint < ActiveRecord::Migration
  def change
  end

  def self.up
    remove_column :paints, :component2
  end
  # You may want to add them back in the self.down class method as well:

  def self.down
    add_column :paints, :component2, :integer
  end
end
