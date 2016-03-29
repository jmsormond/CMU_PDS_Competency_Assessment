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
      build_competency(@competency)
      #render json: @competency.errors, status: :unprocessable_entity
      redirect_to @competency
        #if @competency.save
        #  redirect_to @competency, notice: 'Indicator was successfully created.'
        #else
        #  render json: @competency.errors, status: :unprocessable_entity
        #end
    end
  end

  def upload
    indicator_info = Array.new
    indicator_file = params[:indicators]
    indicators = CSV.read(indicator_file.path, {:headers => true, :encoding => 'windows-1251:utf-8'})
    indicators.each do |indicator|
        indicator_info.push({id: indicator[0], level: indicator[1], name: indicator[2]})
    end
    puts indicator_info
    # update_competency_indicators(indicator_info)

    resource_info = Array.new
    resources_file = params[:resources]
    resources = CSV.read(resources_file.path, {:headers => true, :encoding => 'windows-1251:utf-8'})
    resources.each do |resource|
        resource_info.push({id: resource[0], resource_category: resource[1], name: resource[2], description: resource[3], link: resource[4]})
    end
    puts resource_info
    # update_competency_resources(resource_info)

    relationship_info = Array.new
    relationships_file = params[:relationships]
    relationships = CSV.read(relationships_file.path, {:headers => true, :encoding => 'windows-1251:utf-8'})
    relationships.each do |relationship|
        relationship_info.push({indicator_id: relationship[0], resource_id: relationship[1]})
    end
    puts relationship_info
  end

  def competency_params
    params.require(:Competency).permit(:name)
  end

end
