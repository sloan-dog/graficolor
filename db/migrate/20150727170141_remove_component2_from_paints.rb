class RemoveComponent2FromPaints < ActiveRecord::Migration
  def change
    remove_column :paints, :component2
    remove_column :paints, :component3
  end
end
