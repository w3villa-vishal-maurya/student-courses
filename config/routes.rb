Rails.application.routes.draw do
  devise_for :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "students#landing_page"
  # root to: "devise/sessions#new"
  get "/selected/:choose_course", to: "students#landing_page"
  get "/student/new", to: "students#new"
  get "/student/index", to: "students#index"
  post "/student/create", to: "students#create"
  get "/student/:id", to: "students#show", as: "student_show"
  get "/student/:id/edit", to: "students#edit", as: "student_edit"
  put "/student/:id/update", to: "students#update", as: "student_update"
  delete "/student/:id", to: "students#destroy", as: "student_delete"

  # Routes for Course Model
  # get "/course/new", to: "courses#new"
  # get "/course/index", to: "courses#index"
  # post "/course/create", to: "courses#create"
  # get "/course/:id", to: "courses#show", as: "course_show"
  # get "/course/:id/edit", to: "courses#edit", as: "course_edit"
  # put "/course/:id/update", to: "courses#update", as: "course_update"
  # delete "/course/:id", to: "courses#destroy", as: "course_delete"

  #Association Routes
  get "/student/:id/course/index", to: "courses#index", as: "student_id_course_index"
  post "course_buy", to: "courses#course_buy"
  get "/student/:id/courses", to: "students#student_courses", as: "student_courses"
  delete "/student/:id/courses", to: "students#student_delete_course", as: "student_delete_course"

  resources :courses do
    resources :payments, only: [:show, :index, :new, :create]  # Nest payments under courses
  end

  resources :lectures

  # resources :payments

  resources :contents

  resources :categories

  # Defines the root path route ("/")
  # root "articles#index"
end
