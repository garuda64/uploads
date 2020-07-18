Rails.application.routes.draw do  
  resources :app_csv_configurations
  resources :app_configurations
  #resources :pages
  get "/pages/*page" => "pages#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/pages/portal')
end
