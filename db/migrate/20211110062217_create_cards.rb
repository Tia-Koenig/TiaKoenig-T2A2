class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.integer :number
      t.string :generation
      t.string :set
      t.string :condition

      t.timestamps
    end
  end
end
