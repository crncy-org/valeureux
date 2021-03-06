Myapp::Application.routes.draw do

  resources :topups

  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
        sessions: 'sessions/sessions',
        registrations: 'sessions/registrations'
      }

  resources :transactions do
    collection do
      # get 'qr'
      post 'qrcreate'
    end

    member do # member = for one instance only vs. collection = for all txns
      get 'show_confirm'
      get 'confirm'
      get 'show_qr'
    end
  end

  resources :accounts, :only => [:index, :new, :create, :show]

  root to: 'landing#landing2'

  get "landing/landing2"

  get "home/index"
  get "home/topup"
  get "home/qr"
  get "home/faq"
  get "home/tec"

  get "users/settings"
  get "users/show"

  get 'pages/empty_page'
  get 'pages/signin'
  get 'pages/lockscreen'
  get 'pages/register'
  get 'pages/not_found_error'
  get 'pages/internal_server_error'
  get 'pages/shop_locator'


  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


