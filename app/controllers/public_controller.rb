class PublicController < ApplicationController
  def slow_ajax
  end

  def slow_response
    sleep 3
    render json: { hello: "world" }, status: 200
  end

  def post_slow_response
    render json: { method: "POST", request: true }, status: 200
  end
end
