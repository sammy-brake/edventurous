class FieldExperiencesController < ApplicationController

    def show 
        @experience = FieldExperience.find_by(params[:id])
    end 

    def index 
        @experiences = FieldExperience.all
    end 
end
