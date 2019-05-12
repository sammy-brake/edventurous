class FieldExperiencesController < ApplicationController

    def show 
        @experience = FieldExperience.find_by(params[:id])
    end 

    def index 
        
     if params[:subject]
         @experiences = FieldExperience.all.search_by_subject(params[:subject])
            if @experiences == []
                @subjects = FieldExperience.all
               flash[:error] =  "I'm sorry, no experiences matched that query"
            end 
        
     else 
        @experiences = FieldExperience.all
     end 
    end 
end
