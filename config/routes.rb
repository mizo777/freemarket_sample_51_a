Rails.application.routes.draw do
  devise_for :users
  root 'markup_top_page#home'
  root 'markup_item_detail_page#home'
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
