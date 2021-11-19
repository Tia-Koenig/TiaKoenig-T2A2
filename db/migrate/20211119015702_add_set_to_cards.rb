class AddSetToCards < ActiveRecord::Migration[6.1]
  def change
    add_reference :cards, :genset, null: false, foreign_key: true
  end
end
