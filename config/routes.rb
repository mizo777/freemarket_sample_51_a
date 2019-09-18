Rails.application.routes.draw do
  get 'cards/new'
  get 'cards/show'
  # ログイン
  devise_for :users
  root 'products#index'
  # 取引情報
  resources :orders
  # 商品関連
  resources :products, only: [:index, :new, :create, :show, :destroy] do
    patch :toggle_status
    collection do
      get 'category', defaults: { format: 'json' }
      get 'child_category', defaults: { format: 'json' }
      get 'size_category', defaults: { format: 'json' }
    end
  end
  resources :products, only: [:show] do
    get 'buy'
    post 'buy' => 'products#pay'
  end

  # resources :cards, only: [:new, :show] do
  #   collection do
  #     post 'show' => 'cards#show'
  #     post 'pay' => 'cards#pay'
  #     post 'delete' => 'cards#delete'
  #   end
  # end

  # マイページ
  resources :users, only: [:index] do
    member do
      resources :cards, only: [:new, :show] do
        collection do
          post 'show' => 'cards#show'
          post 'pay' => 'cards#pay'
          post 'delete' => 'cards#delete'
        end
      end
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

  # resources :mypage do
  #   resources :cards, only: [:new, :show] do
  #     collection do
  #       post 'show' => 'cards#show'
  #       post 'pay' => 'cards#pay'
  #       post 'delete' => 'cards#delete'
  #     end
  #   end
  #   collection do
  #     get 'notification'
  #     get 'todo'
  #     get 'like'
  #     get 'exhibit_trading'
  #     get 'exhibiting'
  #     get 'exhibited'
  #     get 'purchase'
  #     get 'purchased'
  #     get 'news'
  #     get 'review'
  #     get 'contact'
  #     get 'sales'
  #     get 'point'
  #     get 'profile'
  #     get 'delivery_address'
  #     get 'card'
  #     get 'card_create'
  #     get 'email_password'
  #     get 'identification'
  #     get 'sms_confirmation'
  #     get 'help_center'
  #     get 'logout'
  #   end
  # end

  # 新規登録
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