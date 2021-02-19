module Api
  module V1
    class PublicController < ApplicationController
      skip_before_action :authenticate_request

      def books
        query = "SELECT books.id, title, author, editorial, publication_year, photo 
          FROM books INNER JOIN book_genres ON books.id = book_genres.book_id
          WHERE book_genres.genre_id = #{params[:id]}
          ORDER BY title ASC;"
        books_genre_db_list = ActiveRecord::Base.connection.execute(query)

        if books_genre_db_list.count == 0
          books_genre_list = []
        end

        books_genre_list = books_genre_db_list.map do | genre |
          {
            id: genre[0], title: genre[1], author: genre[2],  
            editorial: genre[3], publication_year: genre[4], 
            photo: genre[5]
          }
        end

        render json: {
          status: 'ok',
          data: books_genre_list
        }, status: :ok
      end

      def numBooks
        query = "SELECT genres.id, name, photo, count(book_id) as numBooks
          FROM genres INNER JOIN book_genres ON genres.id = book_genres.genre_id
          GROUP BY genres.id, name, photo
          ORDER BY name ASC;"
        books_genre_db_list = ActiveRecord::Base.connection.execute(query)

        if books_genre_db_list.count == 0
          books_genre_list = []
        end

        books_genre_list = books_genre_db_list.map do | genre |
          { id: genre[0], name: genre[1], photo: genre[2], numBooks: genre[3] }
        end

        render json: {
          status: 'ok',
          data: books_genre_list
        }, status: :ok
      end

      def show
        book = Book.find(params[:id]);
        render json: {
          status: 'ok',
          message: 'Book loaded',
          data: book
        }, status: :ok
      end

      private

      def genre_params
        params.permit(:name, :photo)
      end

    end
  end
end