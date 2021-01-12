Rails.application.routes.draw do
  get "/", controller: :posts, action: :index

  resources :posts do
    collection do
      get "/inactive", action: :index_inactive, as: :inactive
    end
  end

  get 'public/examples', controller: :public, action: :slow_ajax
  get 'public/slow_ajax', controller: :public, action: :slow_ajax, as: :slow_ajax
  post 'public/slow_response', controller: :public, action: :post_slow_response
  get 'public/slow_response', controller: :public, action: :slow_response, as: :slow_response
end
