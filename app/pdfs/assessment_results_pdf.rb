class AssessmentResultsPdf < Prawn::Document

	def initialize(emerging_indicators, emerging_resources)
		super(top_margin: 70)
 
        @emerging_indicators = emerging_indicators
        @emerging_resources = emerging_resources
		

		title
		style
		logo
        emerging_indicator_table
        emerging_resource_table
		
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
    	text "Assessment Results for $(@competency)", size: 18, style: :bold
    end

    def emerging_indicator_table
        move_down 30
        text "Your Emerging Indicators", size: 16, style: :bold
        table emerging_indicator_rows do 
            row(0).font_style = :bold
            columns(1..1).align = :center
            self.row_colors = ["D3D3D3","FFFFFF"]
            self.header = true
        end
    end

    def emerging_indicator_rows
        [["  Indicator Name "]] + 
        @emerging_indicators.map do |e|
          [e]
        end
    end


    def emerging_resource_table
        move_down 30
        text "Improve Your Emerging Areas", size: 16, style: :bold
        table emerging_resource_rows do 
            row(0).font_style = :bold
            columns(1..4).align = :center
            self.row_colors = ["D3D3D3","FFFFFF"]
            self.header = true
        end
    end

    def emerging_resource_rows
        [["  Resource Name  ", "  Category  ", "  Description  ", "  Link  "]] +         

        @emerging_resources.map do |er|
        
          [er.name, er.resource_category, er.description, er.link ]
        end
    end





    def page_numbers
    	string = "page <page> of <total>"
	    # Green page numbers 1 to 7
	    options = { :at => [bounds.right - 150, 0],
	                 :width => 150,
	                 :align => :right,
	                 :page_filter => (1..100),
	                 :start_count_at => 1,
	                 :color => "000000" }
	    number_pages string, options
    end



end