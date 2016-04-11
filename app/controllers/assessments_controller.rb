class AssessmentsController < ApplicationController

    def welcome
        
    end

    def choose
        @competencies = Competency.all
    end

    def take_assessment
        @competency = Competency.find(params[:competency_id])
        @questions = Question.by_competency(@competency.id)

        respond_to do |format|
          format.html
          format.js
        end
    end

    def report
        
    end

end
