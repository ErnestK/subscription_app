# frozen_string_literal: true

class Currency < ApplicationRecord
  USD = 'USD'
  BTC = 'BTC'
  CENTS_IN_DOLLARS = 100

  COUNTRY_CURRENCY = [
    USD
  ]
  CRYPTO_CURRENCY = [
    BTC
  ]
end
