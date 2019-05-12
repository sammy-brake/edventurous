class SessionController < ApplicationController

    def new 
        @user = User.new 
    end 

    def create 
    @user = User.find_by(:name => params[:user][:name])
    if @user && @user.authenticate(params[:user][:password]) 
        session[:id] = @user.id 
        redirect_to root_url
    else 
        redirect_to root_url
     end 
    end 

    def destroy
        
            session.clear 
            redirect_to root_url
       
    end 
end 