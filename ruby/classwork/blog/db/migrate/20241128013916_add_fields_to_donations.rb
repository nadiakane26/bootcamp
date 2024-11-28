class AddFieldsToDonations < ActiveRecord::Migration[8.0]
  def change
    add_column :donations, :amount, :integer
    add_reference :donations, :user, null: false, foreign_key: true
    add_column :donations, :stripe_payment_id, :string
    add_column :donations, :donation_type, :string
  end
end
