Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'markup_top_page#home'
  #get 'markup_top_page', to: 'markup_top_page#home'
end
