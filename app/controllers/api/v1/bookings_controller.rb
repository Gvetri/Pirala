module Api
  module V1
    class BookingsController < ApplicationController
      #TODO falta hacer que reconozca el hotel_id como atributo
      before_action :set_booking, only: [:show, :edit, :update, :destroy]
      # before_action :set_hotel, only: [:new,:create]
      acts_as_token_authentication_handler_for User
      respond_to :json

      def index
        # respond_with Booking.where(user_id: params[:user_id])
        @bookings = current_user.bookings
        render :json => {bookings: @bookings}
      end

      def show
            render json: @booking
      end

      def create
        @booking = current_user.bookings.new(booking_params)
        @booking.hotel = @hotel
        respond_to do |format|
          if @booking.save
            format.json { render json: @booking }
          else
            format.json { render json: @booking.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @booking.update(booking_params)
            format.json { head :no_content }
          else
            format.json { render json: @booking.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        #TODO hacer que borre solo los que pertenecen a ese usuario
        if @booking.destroy
          render json: {:code => 0}
        else
          render json: {:code => 1, :messages => @booking.errors.full_messages}
        end

      end

      def edit
        super
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_booking
        @booking = Booking.find(params[:id])
      end

      def set_hotel
        @hotel = Hotel.find(params[:hotel_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.

      def booking_params
        if ['index', 'destroy'].include?(params[:action])
          params.permit(:booking)
        else
          params.require(:booking).permit(:date_in, :date_out, :hotel_id,:user_id,:status)
        end

      end

    end
  end
end