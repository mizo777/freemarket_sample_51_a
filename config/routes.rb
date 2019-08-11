Rails.application.routes.draw do
  devise_for :users
  # 新規登録画面の分割
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      get 'done'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
