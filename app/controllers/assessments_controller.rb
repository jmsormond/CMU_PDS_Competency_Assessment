class AssessmentsController < ApplicationController
    # This controller relates to a non logged-in user taking an assessment. The
    # flow goes welcome -> choose -> take_assessment -> generate_report is
    # called to analyize the report -> renders present_assessment

    def welcome
        
    end

    def choose
        @competencies = Competency.all
    end

    def take_assessment
        if params[:competency_id].blank? or params[:competency_id].nil? or params[:competency_id].empty?
            # Check to make sure that a competency was selected, else rediect
            # back to choose page
            redirect_to assessment_choose_path
            return
        end
        @competency = Competency.find(params[:competency_id])
        @questions = Question.by_competency(@competency.id)
        @count = @questions.size

        # The object @questions is passed to the view because the Quesion model
        # has the attr_accessor 'answer'.

        respond_to do |format|
          format.html
          format.js
        end
    end

    def generate_report
        @competency = Competency.find(params[:competency])
        # Passed back in the params is an array named 'questions'. Each question
        # is an array in the form of [question_id, answer].
        qs = params["questions"]
        @competent = Array.new # questions with answer 'always' or 'often'
        @developing = Array.new # questions with answer 'sometimes'
        @emerging = Array.new # questions with answer 'never' or 'rarely'
        @does_not_apply = Array.new
        qs.each do |q|
            # For each question, check answer and put in appropraite array
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

        render :action => 'present_report'


    end

    def present_report
        @emergingstring = params[:emerging]
        @emergingids = @emergingstring.map do |es| 
            es.to_i 
        end
        @emerging_questions = Array.new
        @emergingids.each do |e|
            @emerging_questions.push(Question.find(e))
        end

        @emerging_indicators = Array.new
        @emerging_resources = Array.new
        @emerging_questions.each do |question|
            question.indicators.each do |indicator|
                @emerging_indicators.push(indicator.description)
                indicator.resources.each do |resource|
                    @emerging_resources.push(resource)
                end
            end
        end


        respond_to do |format|
          format.html
          format.pdf do
            pdf = AssessmentResultsPdf.new(@emerging_indicators, @emerging_resources)
            send_data pdf.render, filename: 'assessment_results.pdf', type: 'application/pdf'
          end
        end
    end

end
