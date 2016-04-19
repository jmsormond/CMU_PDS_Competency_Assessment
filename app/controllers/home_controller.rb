require 'rake'

Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
PDSAssessment::Application.load_tasks # providing your application name is 'sample'

class HomeController < ApplicationController
    before_action :check_authentication, only: [:dashboard]

    def home
    end

    def dashboard
    end

    def populate_rake
        Rake::Task['db:populate'].reenable # in case you're going to invoke the same task second time.
        Rake::Task['db:populate'].invoke
        redirect_to :back
    end

end
