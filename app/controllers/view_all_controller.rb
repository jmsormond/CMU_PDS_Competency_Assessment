class ViewAllController < ApplicationController

	# The first view when you begin the nested view all process
	def index
	end

	# Competency step of the view all process
	def choose_competency
		@competencies = Competency.all
	end

	# Choose Level step
	def choose_level
		@competency = Competency.find(params[:competency_id])
	end

end