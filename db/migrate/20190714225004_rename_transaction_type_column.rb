class RenameTransactionTypeColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :transactions, :type, :type_id
  end
end
