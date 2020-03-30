class Api::SubscriptionsController < ApplicationController
  def create
    customer = Stripe::Customer.list(email: params[:email]).data.first
    customer = Stripe::Customer.create({email: params[:email], source: params[:stripeToken]}) unless customer
    subscription = Stripe::Subscription.create({customer: customer.id, plan: 'basic_subscription'})
    status = Stripe::Invoice.retrieve(subscription.latest_invoice).paid

    #if status
      # register account

    render json: {status: (status ? 'paid' : 'unpaid')}
  end
end
