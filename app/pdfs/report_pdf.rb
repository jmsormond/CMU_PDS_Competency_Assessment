class ReportPdf < Prawn::Document

	def initialize(competencies)
		super(top_margin: 70)
		@competencies = competencies

		title
		style
		logo
		tables
		page_numbers
	end

	def style
		font ("Times-Roman")
		font_size(10)
	end

	def logo
		img = "app/assets/images/logo.png"

		repeat :all do 
			image img, :at => bounds.bottom_left, :scale =>0.25
        end
    end


    def title
    	move_down 0
    	text "All Stored Data", size: 18, style: :bold
    end

    def tables
    end


    def page_numbers
    	string = "page <page> of <total>"
	    # Green page numbers 1 to 7
	    options = { :at => [bounds.right - 150, 0],
	                 :width => 150,
	                 :align => :right,
	                 :page_filter => (1..7),
	                 :start_count_at => 1,
	                 :color => "000000" }
	    number_pages string, options
    end



end





