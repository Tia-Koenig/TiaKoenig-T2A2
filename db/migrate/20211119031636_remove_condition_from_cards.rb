class RemoveConditionFromCards < ActiveRecord::Migration[6.1]
  def change
    remove_column :cards, :condition, :string
  end
end
