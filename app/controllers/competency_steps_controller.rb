class CompetencyStepsController < ApplicationController
	include Wicked::Wizard
	steps :name, :indicators, :resources, :verify

	def show
    	render_wizard
  	end

end
