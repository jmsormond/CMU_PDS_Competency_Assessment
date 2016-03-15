class CompetencyStepsController < ApplicationController
	include Wicked::Wizard
	steps :indicators, :resources, :verify

	def show
		$competency = Competency.find(params[:competency_id])
		@competency = $competency
    	render_wizard
  	end

  	def update
  		puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  		puts params
  		competency = Competency.find($competency.id)
  		competency.attributes = competency.params
  		render_wizard @competency
  	end

end
