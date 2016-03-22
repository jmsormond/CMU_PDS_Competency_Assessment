class CompetencyStepsController < ApplicationController
	include Wicked::Wizard
  include AssessmentHelpers::Builder
  
  steps :indicators, :resources, :verify

	def show
    @competency = Competency.new(session[:competency])
    render_wizard
  end

  def update
  	#@competency = Competency.find(params[:competency_id])
  	#@competency.update_attributes(params[:competency])
  	#render_wizard @competency
    case step
    when :indicators
      session[:competency] = session[:competency].merge(params[:competency])
      @competency = Competency.new(session[:competency])
      redirect_to next_wizard_path
    when :resources
      session[:competency] = session[:competency].merge(params[:competency])
      @competency = Competency.new(session[:competency])
      redirect_to next_wizard_path
    when :verify
      @competency = Competency.new(session[:competency])
        if @competency.save
          redirect_to @competency, notice: 'Indicator was successfully created.'
        else
          render json: @competency.errors, status: :unprocessable_entity
        end
    end
  end

  def competency_params
    params.require(:Competency).permit(:name)
  end

end
