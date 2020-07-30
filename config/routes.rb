Rails.application.routes.draw do
  
  root to: "profiles#index"
  resources :profiles do
    delete 'destroy_image/:id', on: :collection, action: :destroy_image, as: :destroy_image
    resources :documents
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
