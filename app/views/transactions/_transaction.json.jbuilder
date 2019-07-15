json.extract! transaction, :id, :type, :account_id, :amount, :desc, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
