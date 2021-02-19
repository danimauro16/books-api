module Api
  module V1
    class BooksController < ApplicationController
      
      def index
        books = Book.order('created_at')
        render json: {
          status: 'ok',
          message: 'Books loaded',
          data: books
        }, status: :ok
      end
      
      def create
        book = Book.new(book_params)
        if book.save
          render json: {
            status: 'ok',
            message: 'Book saved',
            data: book
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'Error saving book',
            data: book.error
          }, status: :unprocessable_entity
        end
      end

      def destroy
        book = Book.find(params[:id])
        if book.destroy
          render json: {
            status: 'ok',
            message: 'Book deleted',
            data: book
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'Error deleting book',
            data: book.error
          }, status: :unprocessable_entity
        end
      end

      def update
        book = Book.find(params[:id])
        if book.update(book_params)
          render json: {
            status: 'ok',
            message: 'Book updated',
            data: book
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'Error updating book',
            data: book.error
          }, status: :unprocessable_entity
        end
      end

      private

      def book_params
        params.permit(:title, :isbn, :author, :editorial, :publication_year, :photo)
      end

    end
  end
end