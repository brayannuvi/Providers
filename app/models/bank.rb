class Bank < ApplicationRecord
    has_many :accounts
    has_many :suppliers, through: :accounts
    validates :name, presence: true, length: { maximum: 50}
end
