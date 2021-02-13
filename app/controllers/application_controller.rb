# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def render_monads(data:)
    if data.success?
      render json: { data: data.success }
    else
      render json: { message: data.failure },
             status: :bad_request
    end
  end
end
