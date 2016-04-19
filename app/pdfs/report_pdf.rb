class ReportPdf < Prawn::Document

	def initialize(competencies, indicators)
		super(top_margin: 70)
		@competencies = competencies

		title
		style
		logo
		competency_table
		indicator_table
		resource_table
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

    def competency_table
    	move_down 15
    	table competency_rows do 
    		row(0).font_style = :bold
    		columns(1..2).align = :center
    		self.row_colors = ["D3D3D3","FFFFFF"]
    		self.header = true
    	end
    end

    def competency_rows
    	[["  #  ", "  Name "]] + 
	    @competencies.map do |c|
	    
	      [c.id, c.name.to_s ]
	    end
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





