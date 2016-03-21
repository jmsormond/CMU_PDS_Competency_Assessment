class HomeController < ApplicationController

    def home
        indicator_info = Array.new
        indicators = CSV.read('public/Indicators.csv', {:headers => true, :encoding => 'windows-1251:utf-8'})
        indicators.each do |indicator|
            indicator_info.push({id: indicator[0], level: indicator[1], name: indicator[2]})
        end
        puts indicator_info
        # update_competency_indicators(indicator_info)

        resource_info = Array.new
        resources = CSV.read('public/Resources.csv', {:headers => true, :encoding => 'windows-1251:utf-8'})
        resources.each do |resource|
            resource_info.push({id: resource[0], resource_category: resource[1], name: resource[2], description: resource[3], link: resource[4]})
        end
        puts resource_info
        # update_competency_resources(resource_info)

        relationship_info = Array.new
        relationships = CSV.read('public/Relationships.csv', {:headers => true, :encoding => 'windows-1251:utf-8'})
        relationships.each do |relationship|
            relationship_info.push({indicator_id: relationship[0], resource_id: relationship[1]})
        end
        puts relationship_info

    end

end
