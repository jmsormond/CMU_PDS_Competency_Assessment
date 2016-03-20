class HomeController < ApplicationController

    def home
        indicators = SmarterCSV.process('./public/Indicators.csv')
        puts indicators
    end

end
