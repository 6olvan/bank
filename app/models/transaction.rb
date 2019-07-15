class Transaction < ApplicationRecord
  belongs_to :account

  validates :type_id, :amount, :desc, presence: true
  validates :amount, numericality: { only_integer: true}
  validates :type_id, inclusion: { in: [AccountService::TYPE_WRITE_OFF, AccountService::TYPE_TOP_UP],
  		message: 'type not permitted'}

  def getType
  	return 'Write Off' if type_id == AccountService::TYPE_WRITE_OFF
  	'Top Up'
  end
end
