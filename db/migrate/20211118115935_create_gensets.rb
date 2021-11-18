class CreateGensets < ActiveRecord::Migration[6.1]
  def change
    create_table :gensets do |t|
      t.string :set

      t.timestamps
    end
  end
end
