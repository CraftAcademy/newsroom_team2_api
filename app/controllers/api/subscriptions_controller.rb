class Api::SubscriptionsController < ApplicationController
  def create
    render json: {status: 'paid'}
  end
end
