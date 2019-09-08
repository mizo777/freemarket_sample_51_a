Rails.application.routes.draw do
  # ログイン
  devise_for :users
  root 'products#index'
  # 取引情報
  resources :orders, only: [:new]
  # 商品関連
  resources :products, only: [:show] do
    get 'buy'
    post 'buy' => 'products#pay'
  end  
  resources :products, only: [:index, :new, :create, :show] do
    patch :toggle_status
    collection do
      get 'category', defaults: { format: 'json' }
      get 'child_category', defaults: { format: 'json' }
      get 'size_category', defaults: { format: 'json' }
      post 'pay/:id' => 'products#pay'
    end
  end

  # マイページ
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