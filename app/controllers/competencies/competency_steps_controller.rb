class Competencies::CompetencyStepsController < ApplicationController
	include Wicked::Wizard
  
  steps :indicators, :resources, :verify

	def show
		@competency = Competency.find(params[:competency_id])
    render_wizard
  end

  def update
  	@competency = Competency.find(params[:competency_id])
  	@competency.update_attributes(params[:competency])
  	render_wizard @competency
  end

  def create
    @competency = competency.create
    redirect_to wizard_path(steps.first, :competency_id => @competency.id)
  end

end
