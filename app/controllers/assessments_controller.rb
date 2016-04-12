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

    def generate_report
        puts params
        qs = params["questions"]
        @questions = Array.new
        qs.each do |q|
            question = Question.find(q[0])
            question.answer = q[1]["answer"]
            @questions.push(question)
        end

        render 'present_report'

    end

    def present_report
        
    end

    private
    def get_answer(parameters, position)
        if parameters["always" << position]
            return "always"
        elsif parameters["often" << position]
            return "often"
        elsif parameters["sometimes" << position]
            return "sometimes"
        elsif parameters["rarely" << position]
            return "rarely"
        elsif parameters["never" << position]
            return "never"
        elsif parameters["does_not_apply" << position]
            return "does_not_apply"
        else
            return "no_answer"
        end
    end

end
