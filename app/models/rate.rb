# frozen_string_literal: true

class Rate < ApplicationRecord
  belongs_to :base_currency, class_name: 'Currency', foreign_key: 'base_currency_id'
  belongs_to :quote_currency, class_name: 'Currency', foreign_key: 'quote_currency_id'

  def self.usd_rate_for(quote_currency)
    Rate.find_by(base_currency: Currency.find_by(name: Currency::USD), quote_currency: quote_currency)
  end
end
