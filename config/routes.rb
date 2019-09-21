Rails.application.routes.draw do
  # ログイン
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  # 商品関連
  resources :products do
    patch :toggle_status
    collection do
      get 'category', defaults: { format: 'json' }
      get 'child_category', defaults: { format: 'json' }
      get 'size_category', defaults: { format: 'json' }
      post 'pay/:id' => 'products#pay'
    end
    member do
      get :buy
      post :buy, to: 'products#pay'
    end
  end
  resources :product_images, only: [:destroy]

  # マイページ
  resources :users, only: [:index] do
    member do
      resources :mypage, only: [:index] do   
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
          get 'card'
          get 'card_create'
          get 'email_password'
          get 'identification'
          get 'sms_confirmation'
          get 'help_center'
          get 'logout'
        end           
    end
  end

  end
  # 新規登録
  resources :signup, only: [:index] do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      get 'done'
    end
  end
end