Rails.application.routes.draw do











  get 'login'=>'sessions#new'
  post 'login'=>'sessions#create'
  delete 'login'=>'sessions#destroy'

  resources :users do

  end
   resources :managers

  resources :posts do
    collection do
    get 'tag'
    get 'recent'
    post 'recent1'
    get 'recent2'
    get 'recent1'
    get 'checking'
    get 'postscience'
    get 'postculture'
    get 'postart'

    end
      resources :feedbacks do
        collection do


        post 'create1'


        end
      end
    resources :comments
  end



 namespace :admin do
   resources :posts do
     collection do
     get 'shouye'
     get 'recent'
     post 'recent1'
     get 'recent2'
     get 'check'
     post 'check1'
     get 'check2'
     get 'posttag'
     get 'postscience'
     get 'postculture'
     get 'postart'
     post 'verify'
     end
     resources :comments, shallow: true
   end
   get 'login'=>'sessions#new'
   post 'login'=>'sessions#create'
   delete 'login'=>'sessions#destroy'

   root to: 'posts#shouye'

 end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'posts#index'

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
end
