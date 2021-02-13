# frozen_string_literal: true

class ApplicationService
  extend  Dry::Initializer
  include Dry::Monads[:result]

  def self.call(*args, &block)
    new(*args, &block).call
  end
end
