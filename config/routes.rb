Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match "/" => "stocks#new", :via => :get, :as => :new_stock
  match "/" => "stocks#create", :via => :post, :as => :create_forum
end
