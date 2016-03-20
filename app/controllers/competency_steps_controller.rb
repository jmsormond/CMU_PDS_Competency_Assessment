class CompetencyStepsController < ApplicationController
	include Wicked::Wizard
  include AssessmentHelpers::Builder
  
  steps :indicators, :resources, :verify

	def show
    case step
    when :indicators
      @competency = Competency.find(params[:competency_id])
      session[:Competency] = @competency.attributes
    else
      @competency = Competency.new(session[:competency])
    end
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
      @competency.save
      redirect_to next_wizard_path
    when :resources
      session[:competency] = session[:competency].merge(params[:competency])
      @competency = Competency.new(session[:competency])
      redirect_to next_wizard_path
    when :verify
      @competency.save
      redirect_to competency_path(@competency)
    end
  end

  def competency_params
    params.require(:Competency).permit(:name)
  end

end
