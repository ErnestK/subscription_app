# frozen_string_literal: true

module Subscriptions
  class CalculatePeriod < ::ApplicationService
    param :params

    def call
      validate_params.bind do |amount, currency|
        find_usd_rate_price(currency).bind do |rate_price|
          retrive_period(rate_price, amount)
        end
      end
    end

    private

    def validate_params
      validate_currency.bind do |currency|
        validate_amount_for(currency).bind do |amount|
          Success([amount, currency])
        end
      end
    end

    def validate_currency
      currency = Currency.find_by(name: params[:currency])

      if currency
        Success(currency)
      else
        Failure("Cant find currency: #{params[:currency]}")
      end
    end

    def validate_amount_for(currency)
      ::ValidateAmount.call(currency: currency, amount: params[:amount])
    end

    def find_usd_rate_price(quote_currency)
      return Success(1) if Currency::USD == quote_currency.name

      rate = Rate.usd_rate_for(quote_currency)

      if rate
        Success(rate.price)
      else
        Failure("Cant find rate price for currency pair: #{base_currency.name}:#{quote_currency.name}")
      end
    end

    def retrive_period(rate_price, amount)
      # in future we can parametrized subscription
      subscription = Subscription.find_by_name(Subscription::BASE)

      if subscription
        amount_in_usd_cents = rate_price * amount * Currency::CENTS_IN_DOLLARS
        period = (amount_in_usd_cents / subscription.price_usd_cents).to_i

        Success(period)
      else
        Failure("cant find subscription: #{Subscription::BASE}!")
      end
    end
  end
end
