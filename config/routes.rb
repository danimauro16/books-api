Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      
      #Books
      #resources :books
      get 'books', to: 'books#index'
      post 'books', to: 'books#create'
      delete 'books/:id', to: 'books#destroy'
      put 'books/:id', to: 'books#update'

      #genres
      get '/genres', to: 'genres#index'
      get '/genres/:id', to: 'genres#show'
      post '/genres', to: 'genres#create'
      delete '/genres/:id', to: 'genres#destroy'
      put '/genres/:id', to: 'genres#update'

      #book_genres
      post '/books/genres', to: 'book_genres#create'

      #users
      resources :users

      #bookGenres
      get '/genres/books/numbooks', to: 'public#numBooks'
      get '/genres/:id/books', to: 'public#books'
      get '/books/:id', to: 'public#show'

      get '/authenticate', to: 'authentication#authenticate'
    end
  end
end
