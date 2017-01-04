Rails.application.routes.draw do

  root 'main#welcome'

  resources :question_boxes, except: [:show]
  resources :questions, shallow: true do
      resources :possible_answers, only: [:index, :new, :create, :destroy]
  end
  resources :polls, only: [:index, :new, :create, :destroy]

end
