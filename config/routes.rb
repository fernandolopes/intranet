Intranet::Application.routes.draw do

  namespace :frequencia do resources :tipo_de_contratacoes end

  resources :home

 # get "fichario/index/index"
 get "frequencia/admins/show"
 get "frequencia/relatorio_ponto/show"

  namespace :fichario do
    resources :fichas
    resources :assuntos
    resources :origens
    resources :andamentos
    resources :andamento_fichas
  end

  namespace :frequencia do
    resources :orgaos
    resources :setores
    resources :profissoes
    resources :justificadas
    resources :justificativas
    resources :admins
    resources :relatorio_ponto
  end

  namespace :base do
    resources :conhecimentos
  end

  match 'frequencia/relatorio_ponto/show' => 'frequencia/relatorio_ponto#show'

  match 'frequencia/admins/show' => 'frequencia/admins#show'

  match 'users/lista' => "users/lista#index"

  match 'users/:id(.:format)/destroy' => "users/lista#destroy"

  #match 'frequencia' => "frequencia/index#index"
  #match 'fichario' => "fichario/index#index"

  #devise_for :users, :path_names => { :sign_in => "login", :sign_up => "registrar", :sign_out => "sair" }
  devise_for :users, :path_names => { :edit => "editar", :sign_in => "login", :sign_up => "registrar", :sign_out => "sair" },
             :controllers => { :sessions => "users/sessions", :registrations => "users/registrations" }



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admins do
  #     # Directs /admins/products/* to Admin::ProductsController
  #     # (app/controllers/admins/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
