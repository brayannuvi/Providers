class Account < ApplicationRecord
  belongs_to :supplier
  belongs_to :bank

  validates :bank_account_number, length: { maximum: 15}
  validates :bank_id, presence: true
end
