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

  def set_the_cookie
    response.set_cookie(:pupCookie, {
      value: 'CookieJar',
      expires: 1.days.from_now,
      path: '/',
      httponly: true
    })
    redirect_to action: :slow_ajax
  end

  def clear_the_cookie
    cookies.delete(:pupCookie)
    redirect_to action: :slow_ajax
  end

  def download
    file = Rails.root.join("public", "happy.txt")
    response.headers['Content-Disposition'] = 'attachment; filename=happy.txt'
    render file: file, layout: false
  end
end
