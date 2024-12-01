class DonationsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    if params[:recurring] == "1"
      create_recurring_donation
    else
      create_one_time_donation
    end
  end

  def create_one_time_donation
    payment_intent = Stripe::PaymentIntent.create({
      amount: (params[:amount].to_i * 100), # Amount in cents
      currency: 'usd',
      payment_method: params[:payment_method_id],
      confirm: true,
      automatic_payment_methods: { enabled: true, allow_redirects: 'never' }

      
    })
# Save to database
    donation = Donation.create!(
      user: current_user, # Assuming you're associating the donation with the current logged-in user
      amount: params[:amount].to_i,
      recurring: false,
      stripe_payment_id: payment_intent.id,
      donation_type: 'one_time'
    )

    redirect_to root_path, notice: "Thank you for your donation!"
  rescue Stripe::CardError => e
    redirect_to new_donation_path, alert: e.message
  end

def create_recurring_donation
  # https://medium.com/@rail_to_rescue/simple-guide-to-creating-stripe-subscriptions-in-rails-4bfe4e0621ed
  # https://docs.stripe.com/api/subscriptions/create?lang=ruby
  plan_name = 'Donation'
  price_amount = params[:amount].to_i * 100
  currency = 'usd'
  interval = 'month'

  product = Stripe::Product.list(limit: 100).data.find { |p| p.name == plan_name }
  
  unless product
    product = Stripe::Product.create(name: plan_name)
  end

  price = Stripe::Price.create({
  unit_amount: price_amount,
  currency: currency,
  recurring: { interval: interval },
  product: product.id # This is a product that we created above 
})

stripe_customer = Stripe::Customer.create({
  email: params[:email]},
)
Stripe::PaymentMethod.attach(
  params[:payment_method_id],
  { customer: stripe_customer.id }
)
subscription = Stripe::Subscription.create({
  customer: stripe_customer.id,
  items: [{ price: price.id }],
  default_payment_method: params[:payment_method_id ]
})
 
# Save to database
donation = Donation.create!(
  user: current_user,
  amount: params[:amount].to_i,
  recurring: true,
  stripe_payment_id: subscription.id,
  donation_type: 'recurring'
)

redirect_to root_path, notice: "Thank you for your subscription!"
    rescue Stripe::CardError => e
      redirect_to new_donation_path, alert: e.message
end


end
