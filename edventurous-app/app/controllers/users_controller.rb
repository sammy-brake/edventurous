class UsersController < ApplicationController

    def show 
       
        @user = User.find_by(id: session[:user_id])
        @bookings = @user.bookings
        

    
    end 

    def new 
        @user = User.new 
    end 

    def create 
       @user = User.create(user_params)
       if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
       else 
        render :new
       end 
    end 

    def facebook 
        
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['uid']   # Secure Random Hex
          end
          session[:user_id] = @user.id
          redirect_to user_path(@user)
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :subject, :password, :uid, :email)
    end 

    def auth
        request.env['omniauth.auth']
      end
end
