Rails.application.routes.draw do
  resources :cards
  get "paiementsucces", to: "order#paiementsuccess"
  get 'monpaiement', to: "order#monpaiement"
  get 'okorder', to: "order#okorder"
  get 'delete/:id', to: "order#deletemyaction"
  get 'order', to: "order#myorder"
  get 'order/myorder'
  get "inscriptions/success", to: "inscriptions#success", as: :moninscription
  get 'achats/cours'
  devise_scope :user do 
    patch "/okorder", to: "users/registrations#update", as: :editercollectifs_post
    post "/inscription-:mytype", to: "users/registrations#create", as: :inscriptioncollectifs_post
  end
  devise_for :users, controllers: { registrations: 'users/registrations',sessions: 'users/sessions'  }
  resources :courses
  get 'achats-cours-:mytype', to:"achats#cours", as: :achatscours
  get 'achats-cours-:mytype/:id/ajouteraupanier', to:"achats#show", as: :achatscourspanier
  get 'achats-cours-:mytype/:id/add', to:"achats#add", as: :achatsadd
  get 'inscriptions/index'
  resources :courses
  resources :webbillets
  get "/forminscriptions", to: "inscription#form", as: :inscriptionform
  get "/inscription-individuels", to: "inscriptions#individuels", as: :inscriptionindividuels
  get "/inscription-collectifs", to: "inscriptions#collectifs", as: :inscriptioncollectifs

  get "/cours-collectifs-de-:name", to: "courses#show", as: :noscourscollectifsde
  get "/cours-individuels-de-:name", to: "courses#show", as: :noscoursindividuelsde
  get "/nos-cours-:type", to: "courses#index"
  #get 'ifdm/index'
  #get 'contact/index'
  #get 'internships/index'
  #get 'courses/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "ifdm#index"
  get "ifdm", to: "ifdm#index"
  get "nos-cours-individuels", to: "courses#individual", as: :coursindividuel
  get "nos-cours-collectifs", to: "courses#group", as: :courscollectif
  get "nos-cours-:type", to: "courses#index", as: :allcourses
  get "nos-stages", to: "internships#index"
  get "nos-evenements", to: "events#index"
  get "contact-2", to: "contact#index"
end
