class DonationsController < ApplicationController
  def new
  end

  def create
    if params[:recurring] == "true"
      create_recurring_donation
    else
      create_one_time_donation
    end
  end

  def create_one_time_donation
    Stripe::PaymentIntent.create({
      amount: (params[:amount].to_i * 100), # Amount in cents
      currency: 'usd',
      payment_method: params[:payment_method_id],
      confirm: true,
      automatic_payment_methods: { enabled: true, allow_redirects: 'never' }
    })

    redirect_to root_path, notice: "Thank you for your donation!"
  rescue Stripe::CardError => e
    redirect_to new_donation_path, alert: e.message
  end

  # https://docs.stripe.com/billing/quickstart
  def create_recurring_donation
    session = Stripe::Checkout::Session.create({
      mode: 'subscription',
      line_items: [{
        quantity: 1,
        price: prices.data[0].id
      }],
    })

    redirect_to root_path, notice: "Thank you for your subscription!"
  rescue Stripe::CardError => e
    redirect_to new_donation_path, alert: e.message
  end

  # https://docs.stripe.com/api/subscriptions/create

  Stripe::Subscription.create({
  customer: 'cus_Na6dX7aXxi11N4',
  items: [{price: 'price_1MowQULkdIwHu7ixraBm864M'}],
})


end
