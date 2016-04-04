module AssessmentHelpers
	module Builder

		def create_competency_session
			session[:competency] ||= Hash.new
		end

		def clear_competency_session
			session[:competency] = Hash.new
		end

		def destroy_competency_session
			session[:competency] = nil
		end

		def define_association(params)
			session[:indicators] = params
		end

		def build_competency(competency)
			name = competency["name"]
			c_info = {name: name}
			@competency = Competency.new(c_info)


			@competency.save!
			construct_indicators(@competency.id)
			construct_resources
			##construct_associations(@competency.id)
		end

		def construct_resources
		  session[:competency]["indicator_resources_attributes"].each do |params|
		  		
		  		name = params[1]["resource_name"]
		  		link = params[1]["resource_link"]
		  		description = params[1]["resource_description"]
		  		category = params[1]["resource_category"]
		  		
		        info = {name: name, link: link, description: description, resource_category: category}
		        
		        ##Find resource by name
		        if name != ""
			        @resource = Resource.search(name).first
			        if @resource == nil
				  		##if not exist, create new
				        @resource = Resource.new(info)
				        @resource.save!
				    end
				    resource_id = @resource.id
				else
					resource_id = params[1]["resource_id"]
				end 
		        ##then create association
		        indicator_description = params[1]["indicator_description"]
		  		indicator_id = Indicator.by_description(indicator_description).first.id
		        info = {indicator_id: indicator_id, resource_id: resource_id}
		        @indicator_resource = IndicatorResource.new(info)
		        #@indicator_resource.competency_id = competency_id
		        @indicator_resource.save!

		  end
		end

		def construct_indicators(competency_id)
		  session[:competency]["indicators_attributes"].each do |params|
		        info = {description: params[1]["description"], level: params[1]["level"]}
		        @indicator = Indicator.new(info)
		        @indicator.competency_id = competency_id
		        @indicator.save!
		  end
		end

		def construct_associations(competency_id)
		  session[:competency]["indicator_resources_attributes"].each do |params|
		  		description = params[1]["indicator_description"]
		  		indicator_id = Indicator.by_description(description).first.id
		        info = {indicator_id: indicator_id, resource_id: params[1]["resource_id"]}
		        @indicator_resource = IndicatorResource.new(info)
		        #@indicator_resource.competency_id = competency_id
		        @indicator_resource.save!
		  end
		end

	end
end