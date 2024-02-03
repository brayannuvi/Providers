class Supplier < ApplicationRecord
    has_many :accounts
    has_many :banks, through: :accounts
    accepts_nested_attributes_for :accounts

    validates :name, presence: true
    validates :nit, format: { with: /\A\d{9}-\d\z/}, if: :nit_present?
    validates :contact_person_name, presence: true
    validates :contact_person_number, length: { maximum: 10}

    def nit_present?
        nit.present?
    end
end
