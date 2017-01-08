Rails.application.routes.draw do

  root 'main#welcome'

  resources :answers, only: [:new, :create]

  resources :question_boxes, except: [:show]
  resources :questions, shallow: true do
      resources :possible_answers, only: [:index, :new, :create, :destroy]
  end
  resources :polls, only: [:index, :new, :create, :destroy]
  get 'processpoll', to: 'polls#process_poll'

end
