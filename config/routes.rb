Rails.application.routes.draw do

  root 'main#welcome'

  resources :answers, only: [:new, :create]
  get '/proceed_poll/:id', to: 'answers#proceed_poll', as: 'proceed'

  resources :question_boxes
  resources :questions, only: [:edit], shallow: true do
      resources :possible_answers, only: [:index, :new, :create, :destroy]
  end
  resources :polls, only: [:new, :create, :destroy]
  get '/printqbox/:id', to: 'question_boxes#print', as: 'print'

end
