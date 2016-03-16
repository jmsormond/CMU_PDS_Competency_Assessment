class CompetencyStepsController < ApplicationController
	include Wicked::Wizard
  steps *Competency.form_steps

	def show
		@competency = Competency.find(params[:competency_id])
    render_wizard
  end

  def update
  	@competency = Competency.find(params[:competency_id])
  	@competency.update(competency_params(step))
  	render_wizard @competency
  end

  def competency_params(step)
    permitted_attributes = case step
                           when "indicators"
                             [:indicators]
                           end

    params.require(:competency).permit(permitted_attributes).merge(form_step: step)
  end

end
