module Api
  module V1
    class BookGenresController < ApplicationController

      def create
        book_genre_registered = BookGenre.find_by(book_id: params[:book_id], genre_id: params[:genre_id]);
        if book_genre_registered.blank?
          book_genre = BookGenre.new(book_genres_params)
          if book_genre.save
            return render json: {
              status: 'ok',
              message: 'Genre added to Book',
            }, status: :ok
          else
            return render json: {
              status: 'error',
              message: 'Error adding genre to book',
              data: book_genre.error
            }, status: :unprocessable_entity
          end
        end
        
        return render json: {
          status: 'error',
        }, :status => 409
      end

      private

      def book_genres_params
        params.permit(:book_id, :genre_id)
      end
    end
  end
end