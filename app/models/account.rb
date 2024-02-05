class Account < ApplicationRecord
  belongs_to :supplier
  belongs_to :bank

  validates :bank_account_number, length: { maximum: 15}
  validates :bank_id, presence: true

  scope :empty_fields_checked, -> { joins(:bank).select("banks.name as bank_name, CASE WHEN bank_account_number = '' THEN ' Sin información en la tabla' ELSE bank_account_number END AS bank_account_number")}
end
