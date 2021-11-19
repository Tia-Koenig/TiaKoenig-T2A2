class ChangePriceToBeIntegerInCards < ActiveRecord::Migration[6.1]
  def change
    change_column :cards, :price, :integer
  end
end
