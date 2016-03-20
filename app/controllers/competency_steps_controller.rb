class CompetencyStepsController < ApplicationController
	include Wicked::Wizard
  include AssessmentHelpers::Builder
  
  steps :name, :indicators, :resources, :verify

	def show
    case step
    when :name
      @competency = competency.new
      session[:competency] = nil
    else
      @competency = competency.new(session[:competency])
    end
    render_wizard
  end

  def update
  	#@competency = Competency.find(params[:competency_id])
  	#@competency.update_attributes(params[:competency])
  	#render_wizard @competency
    case step
    when :name
      @competency = Competency.new(competency_params)
      session[:Competency] = @competency.attributes
      redirect_to next_wizard_path
    when :indicators
      session[:competency] = session[:competency].merge(params[:competency])
      @competency = Competency.new(session[:competency])
      @competency.save
      redirect_to competency_path(@competency)
    when :resources
      session[:competency] = session[:competency].merge(params[:competency])
      @competency = Competency.new(session[:competency])
    when :verify
      @competency.save
    end
  end

  def competency_params
    params.require(:Competency).permit(:name)
  end

end
