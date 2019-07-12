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
            
            flash[:success] = "Booking scheduled"
            redirect_to user_path(@booking.user_id)
        else 
            flash[:error] = "Booking failed, please select a date and try again."
            redirect_to new_field_experience_booking_path(@experience)
        end 
    end 

    def index 
        if params[:field_experience_id]
            @experience = FieldExperience.find(params[:field_experience_id])
        end 
        @user = User.find(session[:user_id])
        @bookings = @user.bookings
        respond_to do |format|

                    format.html 
                    format.json { render json: @bookings }
                  
                   end
        
    end 
   

    def show 
            
            @booking = Booking.find(params[:id])
            @field_experience = FieldExperience.find(params[:field_experience_id])
        respond_to do |format|

            format.html 
            format.json { render json: @experiences }
          
           end

    end 
end
