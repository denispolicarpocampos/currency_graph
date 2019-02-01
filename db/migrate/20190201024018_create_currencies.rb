class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :type
      t.string :integer
      t.string :value
      t.string :float
      t.string :date
      t.string :datetime

      t.timestamps
    end
  end
end
