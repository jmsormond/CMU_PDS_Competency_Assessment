class ViewAllController < ApplicationController

	# The first view when you begin the nested view all process
	def index
	end

	# Competency step of the view all process
	def show_all_competencies
		@competencies = Competency.all
	end

end