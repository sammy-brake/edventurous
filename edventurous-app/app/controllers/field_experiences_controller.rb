class FieldExperiencesController < ApplicationController

    def new
        @experience = FieldExperience.new
    end 

    def create 
        
        @experience = FieldExperience.new(experience_params)
        if @experience.save 
            redirect_to field_experiences_path
        else 
            render :new
        end 

    end 

    def show 
        @experience = FieldExperience.find_by(params[:id])
    end 

    def index 
     if params[:subject]
         @experiences = FieldExperience.search_by_subject(params[:subject])
            if @experiences == []
               flash[:error] =  "I'm sorry, no experiences matched that query"
            end 
        
     else 
        @experiences = FieldExperience.all
     end 
    end 

    private 

    def experience_params
        params.require(:field_experience).permit(:title, :subject, :location, :gradelevels, :summary)
    end 
end
