# frozen_string_literal: true

class ValidateAmount < ::ApplicationService
  option :currency
  option :amount

  def call
    if Currency::CRYPTO_CURRENCY.include?(currency.name)
      crypto_currency_validation(amount)
    elsif Currency::COUNTRY_CURRENCY.include?(currency.name)
      country_currency_validation(amount)
    else 
      Failure("Invalid currency group for #{currency.name}!")
    end
  end

  private

  def country_currency_validation(amount)
    # TODO: regexp magic here
    is_valid_by_regexp = true
    if is_valid_by_regexp
      Success(amount.to_d)
    else 
      Failure("You should use valid format for country currency!")
    end
  
  end

  def crypto_currency_validation(amount)
    # TODO: regexp magic here
    is_valid_by_regexp = true
    if is_valid_by_regexp
      Success(amount.to_d)
    else 
      Failure("You should use valid format for crypto currency!")
    end
  end
end