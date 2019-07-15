class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :type, null: false
      t.belongs_to :account, foreign_key: true
      t.decimal :amount, null: false
      t.string :desc, null: false

      t.timestamps
    end
  end
end
