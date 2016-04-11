class HomeController < ApplicationController
    before_action :check_authentication, only: [:dashboard]

    def home
    end

    def dashboard
    end

end
