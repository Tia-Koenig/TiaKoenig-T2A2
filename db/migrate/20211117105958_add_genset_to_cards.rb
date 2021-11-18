class AddGensetToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :genset, :string
  end
end
