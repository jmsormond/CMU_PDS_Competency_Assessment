class CompetencyStepsController < ApplicationController
	include Wicked::Wizard
  include PDSHelpers::Builder
  
  steps :indicators, :resources, :verify

	def show
    ##Reckless testing
		#@competency = Competency.find(params[:competency_id])
    create_competency_session
    update_competency_name("Crocodile Hunting")
    indicator_info = {description: "Carries a big knife", level: "Champion"}
    update_competency_indicators(indicator_info)
    resource_info = {indicator_id: 0, category: "MOVIE", link: "wikipedia.com", name: "Wikipedia", description: ""}
    update_competency_resources(resource_info)
    build_competency
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
