# frozen_string_literal: true

RSpec.describe 'POST api/subscriptions', type: :request do
  before do
    post '/api/subscriptions', params: { stripeToken: 'tok_1GRG6ZAW8HWEjAbEX381j7SB', email: 'thomas@mail2.com' }
  end

  it 'responds with success status' do
    expect(response_json).to eq JSON.parse({ status: 'paid' }.to_json)
  end

  it 'creates or retrieves a customer on stripe' do
    expect(Stripe::Customer.list.data.first.email).to eq 'thomas@mail2.com'
  end

  it 'creates a subscription for a specific user' do
    expect(Stripe::Customer.list(email: 'thomas@mail2.com').first.subscriptions).to be_truthy
  end

  it 'subscription for a specific user is a specific subscription plan' do
    expect(Stripe::Customer.list(email: 'thomas@mail2.com').first.subscriptions.first.plan.id).to eq 'basic_subscription'
  end
end
