module Api
  module V1
    class HotelsController < ApplicationController
      # acts_as_token_authentication_handler_for User
      respond_to :json

      def index
        respond_with Hotel.all
      end

      def show
        respond_with Hotel.find(params[:id])
      end

      def create
        respond_with Hotel.create(params[:hotel])
      end

      def update
        respond_with Hotel.update(params[:id],params[:hotel])
      end

      def destroy
        respond_with Hotel.destroy(params[:id])
      end


    end
  end
end