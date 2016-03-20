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

		def update_competency_name(name)
			create_competency_session
			session[:competency][:name] = name
		end

		def update_competency_indicators(indicators)
			##Feed me an array of indicator hashes
			session[:competency][:indicators] = indicators;
		end

		def update_competency_resources(resources)
			session[:competency][:resources] = resources;
		end

		def build_competency
			competency = Competency.new
			construct_indicators(competency.id)
			construct_resources
		end

		def construct_association(resource_id, indicator_id)
			new_array = Array.new
			session[:competency][:resources].each do |params|
				new_array.push(Indicator.new(params))
			end
			session[:competency][:indicators] = new_array
		end

		def construct_indicators
			new_array = Array.new
			session[:competency][:indicators].each do |params|
				@indicator = Indicator.new
				params[:id] = @indicator.id
				@indicator = Indicator.new(params)
				new_array.push(@indicator)
			end
			session[:competency][:indicators] = new_array
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