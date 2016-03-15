class CompetencyStepsController < ApplicationController
	include Wicked::Wizard
	steps :indicators, :resources, :verify

	def show
		@competency = Competency.find(params[:competency_id])
    	render_wizard
  	end

end
