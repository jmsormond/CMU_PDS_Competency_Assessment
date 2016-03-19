class HomeController < ApplicationController
    require 'smarter_csv'

    def home
        indicators = SmarterCSV.process('/tmp/Indicators.xlsx')
        puts indicators
    end

end
