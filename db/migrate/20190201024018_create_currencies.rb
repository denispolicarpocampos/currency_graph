class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :currency_kind
      t.float :value
      t.datetime :date

      t.timestamps
    end
  end
end
