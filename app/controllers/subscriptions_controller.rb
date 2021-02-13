# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    params.require(:currency)
    params.require(:amount)

    render_monads data: Subscriptions::CalculatePeriod.call(params)
  end
end
