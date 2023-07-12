Rails.application.routes.draw do
  resources :webbillets
  #get 'ifdm/index'
  #get 'contact/index'
  #get 'internships/index'
  #get 'courses/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "ifdm#index"
  get "ifdm", to: "ifdm#index"
  get "nos-cours-individuels", to: "courses#individual", as: :coursindividuel
  get "nos-cours-collectifs", to: "courses#group", as: :courscollectif
  get "nos-stages", to: "internships#index"
  get "nos-evenements", to: "events#index"
  get "contact-2", to: "contact#index"
end
