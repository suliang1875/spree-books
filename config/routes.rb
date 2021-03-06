Rails.application.routes.draw do
	 root :to => 'channel/balances#index'
  match '/visit' => 'home#list'
  match '/vamp/mtkbook/details.aspx' => 'books#details'
  match 'cminterface/sms/sync.aspx' => 'books#sync'
  match '/resource/books/cover/:id.:format' => 'book_covers#show'
  match '/resource/books/cover/' => 'book_covers#show'
  match '/tools/:action' => 'tools'
  
  namespace :admin do
    resources :books
    resources :book_chapters
    resources :companies
    resources :customers
    resources :channels
    resources :book_types do
    	match 'add' => 'book_types#addtype'
    end
    resources :book_clients
    resources :charts
    match 'book_configuration(/:action/(:id))' => 'book_configuration#index'
    match 'tools' => 'tools'
    match 'balances(/:action)' => 'balances'
    match 'companies/:id/save_customer' => 'companies#save_customer'
  end
  
  namespace :reader do
  	resources :books
  	match 'pages/:action' => 'pages'
  	match 'pages/books/:id(/:op(/:ch))' => 'pages#books'
  	match 'sync/:action' => 'sync'
  end

	scope '/~bkb4info' do
	  namespace :reader do
	  	resources :books
	  	match 'pages/:action' => 'pages'
	  	match 'pages/books/:id(/:op(/:ch))' => 'pages#books'
	  	match 'sync/:action' => 'sync'
	  end
	end

  
  namespace :channel do
  	match 'balances' => 'balances#index'
  end
  
  
  match 'home/test' => 'home#test_here'
  
  
end
