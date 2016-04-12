class AssessmentsController < ApplicationController

    def welcome
        
    end

    def choose
        @competencies = Competency.all
    end

    def take_assessment
        if params[:competency_id].blank? or params[:competency_id].nil? or params[:competency_id].empty?
            redirect_to assessment_choose_path
            return
        end
        @competency = Competency.find(params[:competency_id])
        @questions = Question.by_competency(@competency.id)

        respond_to do |format|
          format.html
          format.js
        end
    end

    def generate_report
        @competency = Competency.find(params[:competency])
        qs = params["questions"]
        @competent = Array.new
        @developing = Array.new
        @emerging = Array.new
        @does_not_apply = Array.new
        qs.each do |q|
            question = Question.find(q[0])
            answer = q[1]["answer"]
            question.answer = answer
            if answer.eql?("always") or answer.eql?("often")
                @competent.push(question)
            elsif answer.eql?("sometimes")
                @developing.push(question)
            elsif answer.eql?("rarely") or answer.eql?("never")
                @emerging.push(question)
            else
                @does_not_apply.push(question)
            end
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
