Rails.application.routes.draw do
  get 'reviews/create'
  devise_for :users
  root to: 'pages#home'
  resources :skills do
    resources :bookings, only: [:new, :create, :show] do 
      resources :payments, only: :new
    end
    resources :reviews, only: [:new, :create]
  end
  patch "/skills/:skill_id/bookings/:id", to: "bookings#validate", as: :validate_skill_booking
  patch "/skills/:skill_id/bookings/:id/cancel", to: "bookings#cancel", as: :cancel_skill_booking
  get "/account/users-bookings", to: "bookings#users_bookings", as: :users_bookings
  get "/account/my-bookings", to: "bookings#my_bookings", as: :my_bookings
  post "/skills/:skill_id/bookings/:id/pay", to: "bookings#pay", as: :booking_pay
  mount StripeEvent::Engine, at: '/stripe-webhooks'
end


              # root GET    /                             pages#home
            # skills GET    /skills(.:format)             skills#index
                   # POST   /skills(.:format)             skills#create
         # new_skill GET    /skills/new(.:format)         skills#new
        # edit_skill GET    /skills/:id/edit(.:format)    skills#edit
             # skill GET    /skills/:id(.:format)         skills#show
                   # PATCH  /skills/:id(.:format)         skills#update
                   # PUT    /skills/:id(.:format)         skills#update
                   # DELETE /skills/:id(.:format)         skills#destroy
