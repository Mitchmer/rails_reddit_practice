Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'subs#index'

  resources :subs do 
    resources :topics
  end

  scope 'topics/:topic_id', as: 'topic' do
    resources :comments, only: [:new, :create]
  end
  
end
