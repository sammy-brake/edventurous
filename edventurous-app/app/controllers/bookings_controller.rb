class BookingsController < ApplicationController

    def new 
        @booking = Booking.new
        @booking.field_experience = FieldExperience.find_by(id: params[:field_experience_id])
        @booking.user_id = session[:user_id]
    end 

    def create 
        @booking = Booking.new
        @booking.user_id = session[:user_id]
        @booking.date = params[:booking][:date]
        @experience = FieldExperience.find_by(id: params[:booking][:field_experience_id])
        @booking.field_experience = @experience
        if @booking.save
            redirect_to user_path(@booking.user_id)
        else 
            binding.pry 
            flash[:error] = "Booking failed, please select a date and try again."
            redirect_to new_field_experience_booking_path(@experience)
        end 
    end 

    def index 
        @experience = FieldExperience.find_by(id: params[:field_experience_id])
        @bookings = @experience.bookings 
    end 
end
