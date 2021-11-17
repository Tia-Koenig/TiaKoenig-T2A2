class RemoveSetFromCards < ActiveRecord::Migration[6.1]
  def change
    remove_column :cards, :set, :string
  end
end
