class Supplier < ApplicationRecord
    has_many :accounts, dependent: :destroy
    has_many :banks, through: :accounts
    accepts_nested_attributes_for :accounts, allow_destroy: true

    validates :name, presence: true
    validates :nit, format: { with: /\A\d{9}-\d\z/}, if: :nit_present?
    validates :contact_person_name, presence: true
    validates :contact_person_number, length: { maximum: 10}

    scope :empty_fields_checked, -> { select("suppliers.id, suppliers.name as supplier_name, CASE WHEN nit = '' THEN ' Sin información en la tabla' ELSE nit END AS nit, suppliers.contact_person_name, CASE WHEN contact_person_number = '' THEN ' Sin información en la tabla' ELSE contact_person_number END AS contact_person_number")}

    def nit_present?
        nit.present?
    end
end
