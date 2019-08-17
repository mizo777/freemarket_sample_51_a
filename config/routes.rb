Rails.application.routes.draw do
  root 'markup_top_page#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'markup_item_detail_page#home'
end
