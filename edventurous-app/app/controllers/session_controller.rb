class SessionController < ApplicationController

    def signin 
        @user = User.new 
    end 

    def create 
       
    @user = User.find_by(:email => params[:user][:email])
    if @user && @user.authenticate(params[:user][:password]) 
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    else 
        flash[:error] = "Please re-enter your email and password and try again."
       
        redirect_to signin_path
     end 
    end 

    def destroy
            session.clear 
            redirect_to root_url
    end 
end 