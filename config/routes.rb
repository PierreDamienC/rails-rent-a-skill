Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :skills do 
    resources :bookings, only: [:new, :create, :show]
  end
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
