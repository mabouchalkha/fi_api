require 'subscribem/constraints/subdomain_required'

Foodinspectors::Application.routes.draw do

   constraints(Subscribem::Constraints::SubdomainRequired) do
      root :to => "foodinspectors#index"
   
   end

   namespace :api, defaults: {format: 'json'} do
      namespace :v1 do

      end 
   end
   
   mount Subscribem::Engine, :at => '/'
   # devise_for :users, 
   #    :controllers => {
   #       registrations: "users/registrations", 
   #       sessions: "users/sessions"
   #    }#, via: :options
      
   # devise_scope :user do
   #    post '/check/is_user' => 'users/users#is_user', as: 'is_user'
   #    post '/current_user' => 'users/sessions#get_current_user'
   # end

   # get 'users', :to => 'users#index'
   
   # scope '(:locale)' do
   #    resources :contacts
   # end
end
