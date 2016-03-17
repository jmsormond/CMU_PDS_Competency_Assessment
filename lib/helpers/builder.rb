module PDSHelpers
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
			session[:competency][:name] = name
		end

		def update_competency_indicators(indicators)
			##Feed me a hash of indicators
			indicators_array = Array.new
			indicators.each do |description, level|
				indicator_info = {description: description, level: level}
				indicators_array << indicator_info
			end
			session[:competency][:indicators] = indicators_array;
		end

		def update_competency_resources(resources)
			##Feed me a hash of resources
			resources_array = Array.new
			resources.each do |indicator_id, category, link, name, description|
				resource_info = {indicator_id: indicator_id, resource_category: category, link: link, name: name, description: description}
				resource_info << resources_array
			end
			session[:competency][:resources] = resources_array
		end

		def build_competency
			competency = Competency.new
			construct_indicators(competency.id)
			construct_resources
		end

		def construct_association(resource_id, indicator_id)
			info = {resource_id: resource_id, indicator_id: indicator_id}
			IndicatorResource.new(info)
		end

		def construct_indicators(competency_id)
			session[:competency][:indicators].each do |description, level|
				info = {competency_id: competency_id, description: description, level: level}
				Indicator.new(info)
			end
		end

		def construct_resources
			session[:competency][:resources].each do|indicator_id, category, link, name, description|
				##Is resource in database alreaady?
				currentResource = Resources.find_by name: name, link: link, category: category, description: description
				if currentResource == nil
					##If no, create it!
					info = {name: name, link: link, resource_category: category, description: description}
					currentResource = Resources.new(info)
				end
				##Now connect the indicator with the resource
				construct_association(resource_id, indicator_id)
			end
		end

	end
end