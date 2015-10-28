Rails.application.routes.draw do

  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

  get '/divorce', to: 'application#divorce'

  # This has to be the last route in your list
  match "*path", to: "errors#show", via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  mount Optimadmin::Engine => "/admin"
  root to: 'application#index'
end

Optimadmin::Engine.routes.draw do
  resources :services, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :departments, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end

end
