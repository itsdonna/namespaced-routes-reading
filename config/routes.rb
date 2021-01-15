Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]
  
  # get '/admin/stats', to: 'stats#index'
# scope allows to prefix block of routes under one grouping to keep code DRY. groups URLS

  # scope '/admin' do
  #   resources :stats, only: [:index]
  # end 
  
  #scope changed due to subfolder structure changing in controller and views. 
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  namespace :admin do
    resources :stats, only: [:index]
  end 


  root 'posts#index'
end
