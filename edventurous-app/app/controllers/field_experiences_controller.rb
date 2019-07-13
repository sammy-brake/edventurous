class FieldExperiencesController < ApplicationController

    def new
        @experience = FieldExperience.new
    end 

    def create 
        
        @experience = FieldExperience.new(experience_params)
        if @experience.save 
            render json: @experience, status: 201
        else 
            render :new
        end 

    end 

    def show 
        @experience = FieldExperience.find(params[:id])
        
        respond_to do |format|

            format.html 
            format.json { render json: @experience }
          
           end
    end 

    def index 
     if params[:subject]
         @experiences = FieldExperience.search_by_subject(params[:subject])
            if @experiences == []
               flash[:error] =  "I'm sorry, no experiences matched that query"
            end 
        
     else 
        @experiences = FieldExperience.all
        respond_to do |format|

            format.html 
            format.json { render json: @experiences }
          
           end
     end 

     def destroy 
        
        @experience = FieldExperience.find(params[:id])
        @experience.destroy 
        redirect_to field_experiences_path
     end 

     
    end 

    private 

    def experience_params
        params.require(:field_experience).permit(:title, :subject, :location, :gradelevels, :summary)
    end 
end
