class HomeController < ApplicationController

    def home
        indicators = CSV.read('public/Indicators.csv', {:headers => true, :encoding => 'windows-1251:utf-8'})
        indicators.each do |indicator|
            puts "-----------"
            puts indicator
        end
    end

end
