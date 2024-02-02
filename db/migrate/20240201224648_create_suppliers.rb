class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :nit
      t.string :contact_person_name
      t.string :contact_person_number

      t.timestamps
    end
  end
end
