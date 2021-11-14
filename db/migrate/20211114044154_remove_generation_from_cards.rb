class RemoveGenerationFromCards < ActiveRecord::Migration[6.1]
  def change
    remove_column :cards, :generation, :string
  end
end
