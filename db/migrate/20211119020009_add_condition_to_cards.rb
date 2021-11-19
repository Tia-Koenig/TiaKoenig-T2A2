class AddConditionToCards < ActiveRecord::Migration[6.1]
  def change
    add_reference :cards, :card_condition, null: false, foreign_key: true
  end
end
