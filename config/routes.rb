Rails.application.routes.draw do
  #devise_for :users
  #root 'markup_top_page#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'markup_item_detail_page#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      get 'done'
    end
  end
end
