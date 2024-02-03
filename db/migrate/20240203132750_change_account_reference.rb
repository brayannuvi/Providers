class ChangeAccountReference < ActiveRecord::Migration[7.1]
  def change
    remove_reference :accounts, :user, foreign_key: true
    add_reference :accounts, :supplier, foreign_key: true
  end
end
