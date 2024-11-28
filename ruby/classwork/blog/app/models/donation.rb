class Donation < ApplicationRecord
belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :donation_type, inclusion: { in: ['one_time', 'recurring'] }
  validates :stripe_payment_id, presence: true
end
