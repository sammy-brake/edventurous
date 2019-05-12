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
        @booking.field_experience = FieldExperience.find_by(id: params[:booking][:field_experience_id])
        if @booking.save 
            redirect_to user_path(@booking.user_id)
        else 
            flash[:error] = "Booking failed, please try again"
            redirect_to root_path 
        end 
    end 

    def index 
        @experience = FieldExperience.find_by(id: params[:field_experience_id])
        @bookings = @experience.bookings 
    end 
end
