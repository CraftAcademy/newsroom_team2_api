# frozen_string_literal: true

RSpec.describe 'POST api/subscriptions', type: :request do
  before do
    post '/api/subscriptions', params: { stripeToken: '123434', email: 'thomas@craft.com' }
  end

  it 'responds with success status' do
    expect(response_json).to eq JSON.parse({ status: 'paid' }.to_json)
  end

  it 'creates a subscription for a specific user' do
    # check the customer entry on stripe to have thomas@craft.com as email
  end

  it 'subscription for a specific user is a specific subscription plan' do
    # check if the customer has purchased a subscription plan
  end
end
