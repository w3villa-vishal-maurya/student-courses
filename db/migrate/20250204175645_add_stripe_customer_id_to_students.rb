class AddStripeCustomerIdToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :stripe_customer_id, :string
  end
end
