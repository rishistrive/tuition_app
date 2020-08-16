Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :teachers do
    member do
      get :received_course_requests
    end
  end

  resources :students
  resources :course_join_requests, only: [] do
    get 'send_request/:course_id' => 'course_join_requests#send_request', as: 'send_request'
    member do
      get :approve
    end
  end

  resources :courses do
    collection do
      get :filters
      get :unapproved
    end

    member do
      get :approve
    end
  end
  root to: 'home#index'
end
