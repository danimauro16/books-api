module Api
  module V1
    class GenresController < ApplicationController
      def index
        genres = Genre.order('created_at')
        render json: {
          status: 'ok',
          message: 'Genres loaded',
          data: genres
        }, status: :ok
      end

      def show
        genre = Genre.find(params[:id]);
        render json: {
          status: 'ok',
          message: 'Genre loaded',
          data: genre
        }, status: :ok
      end
      
      def create
        genre = Genre.new(genre_params)
        if genre.save
          render json: {
            status: 'ok',
            message: 'Genre saved',
            data: genre
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'Error saving genre',
            data: genre.error
          }, status: :unprocessable_entity
        end
      end

      def destroy
        genre = Genre.find(params[:id]);
        if genre.destroy
          render json: {
            status: 'ok',
            message: 'Genre deleted',
            data: genre
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'Error deleting genre',
            data: genre.error
          }, status: :unprocessable_entity
        end
      end

      private

      def genre_params
        params.permit(:name, :photo)
      end

    end
  end
end