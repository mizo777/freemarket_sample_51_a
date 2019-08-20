Rails.application.routes.draw do
  devise_for :users
  root 'markup_top_page#home'

  resources :products do
    collection do
      get 'detail'
      get 'purchase_confirmation'
    end
  end

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      get 'done'
    end
  end
  # マイページ
  resources :mypage do
    collection do
      get 'notification'
      get 'todo'
      get 'like'
      get 'exhibit_trading'
      get 'exhibiting'
      get 'exhibited'
      get 'purchase'
      get 'purchased'
      get 'news'
      get 'review'
      get 'contact'
      get 'sales'
      get 'point'
      get 'profile'
      get 'delivery_address'
      get 'payment'
      get 'email_password'
      get 'identification'
      get 'sms_confirmation'
    end
  end
  # メルカリガイド
  get 'help_center' => 'mypage#index'
end
