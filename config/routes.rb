Rails.application.routes.draw do
  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

  resources :services, only: :show do
    collection do
      get 'update-alphabetical-list', to: 'services#a_to_z', as: 'alpabetical_list'
    end
  end
  resources :articles, only: [:index, :show]
  resources :departments, only: :show
  resources :audiences, only: :show
  resources :case_studies, only: [:index, :show]

  get '/divorce', to: 'application#divorce'

  mount Optimadmin::Engine => "/admin"
  mount Flip::Engine => "/admin/features"

  # This has to be the last route in your list
  match "*path", to: "errors#show", via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  root to: 'application#index'
end

Optimadmin::Engine.routes.draw do
  resources :additional_contents, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  mount Flip::Engine => "/flip"
  resources :tour_entries, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :team_member_roles, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :team_members, except: [:show] do
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
  resources :audiences, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :videos, except: [:show] do
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
  resources :video_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  get 'service/show'

  resources :frequently_asked_questions, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :testimonials, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :downloads, except: [:show] do
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
  resources :download_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :case_studies, except: [:show] do
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
  resources :case_study_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :articles, except: [:show] do
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
  resources :article_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :offices, except: [:show] do
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
  resources :office_locations, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :services, except: [:show] do
    resources :related_services, only: [:index, :destroy]
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
