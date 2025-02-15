class AddColumnsToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :student, null: false, foreign_key: true
    add_column :payments, :total_payment, :float
    add_column :payments, :payment_type, :integer
    add_column :payments, :status, :integer, default: 0, null: false
  end
end
