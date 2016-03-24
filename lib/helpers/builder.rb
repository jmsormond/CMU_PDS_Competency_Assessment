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

		def build_competency(competency)
			name = competency["name"]
			c_info = {name: name}
			@competency = Competency.new(c_info)


			@competency.save!
			construct_indicators(@competency.id)

			#associate_indicators(@competency)
		end

		def construct_association(resource_id, indicator_id)
			#new_array = Array.new
			#session[:competency][:indicator_resources].each do |resource_id|
			#	indicator_id = 
			#end
		end

		def construct_indicators(competency_id)
		  session[:competency]["indicators_attributes"].each do |params|
		        info = {description: params[1]["description"], level: params[1]["level"]}
		        @indicator = Indicator.new(info)
		        @indicator.competency_id = competency_id
		        @indicator.save!
		  end
		end

		def associate_indicators(competency)
		  competency.indicators.each do |competency_id|
		        indicator.competency_id = competency.id
		  end
		end

		def construct_resources
			session[:competency][:resources].each do|params|
				##Is resource in database alreaady?
				#name = params.name
				#currentResource = Resource.find_by name: name
				#if currentResource == nil
					##If no, create it!
				#	currentResource = Resource.new(params)
				#end
				##Now connect the indicator with the resource
				construct_association(currentResource.id, indicator_id)
			end
		end

	end
end