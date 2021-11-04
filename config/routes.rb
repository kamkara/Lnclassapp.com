Rails.application.routes.draw do
  
  root to:'home#index'
  get "espace-enseignant", to:'dashboard#index'
  get "lesson", to:'courses#new'
  resources :courses, :materials, :levels

  resources :classrooms, only: [:index, :new, :create, :show] do
    resources :exercices, only: [:new, :create, :show]
  end

  resources :exercices, except: [:new, :show, :edit, :create, :update, :destroy, :index] do
    member do
      delete 'delete', to: 'exercices#destroy'
      post '/publish', to: 'exercices#pubish'
    end
    #resources :questions, only: [:new, :create, :destroy]
    #resources :results, only: [:new, :create]
    
  end


  ######### USER DATA #########
  devise_scope :user do
    get 'profile/edit'    => 'devise/registrations#edit',   :as => :edit_user_registration
    get 'profile/cancel'  => 'devise/registrations#cancel', :as => :cancel_user_registration
  end

  devise_for  :users,
              :path => '',
              :path_names => {  :sign_in =>       'connexion',
                                :sign_out =>      'logout',
                                :sign_up =>       '',
                                :registration =>  'inscription',
                                :edit =>          'edit'
                              }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
