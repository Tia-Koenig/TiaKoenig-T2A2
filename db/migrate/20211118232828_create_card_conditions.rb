class CreateCardConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :card_conditions do |t|
      t.string :condition

      t.timestamps
    end
  end
end
