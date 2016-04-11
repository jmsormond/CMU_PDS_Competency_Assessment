class AssessmentsController < ApplicationController

    def welcome
        
    end

    def choose
        @competencies = Competency.all
    end

    def take_assessment
        
    end

    def report
        
    end

end
