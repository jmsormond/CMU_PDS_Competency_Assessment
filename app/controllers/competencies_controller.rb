class CompetenciesController < ApplicationController
  before_action :set_competency, only: [:show, :edit, :update, :destroy]

  # GET /competencies
  # GET /competencies.json
  def index
    @competencies = Competency.all
  end

  # GET /competencies/1
  # GET /competencies/1.json
  def show
    @indicators = @competency.indicators.alphabetical.to_a
  end

  # GET /competencies/new
  def new
    @competency = Competency.new
  end

  # GET /competencies/1/edit
  def edit
  end

  # POST /competencies
  # POST /competencies.json
  def create
    session[:competency] = nil
    @competency = Competency.new(competency_params)
    if @competency.save
      session[:competency] = @competency.attributes
      redirect_to competency_steps_path
    end
      # if @competency.save
      #   format.html { redirect_to competency_steps_path }
      #   #format.html { redirect_to competency_steps_path(competency_id: @competency.id) }
      #   #format.json { render action: 'show', status: :created, location: @competency }
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @competency.errors, status: :unprocessable_entity }
      # end
    #end
  end

  # PATCH/PUT /competencies/1
  # PATCH/PUT /competencies/1.json
  def update
    respond_to do |format|
      if @competency.update(competency_params)
        format.html { redirect_to @competency, notice: 'Competency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competencies/1
  # DELETE /competencies/1.json
  def destroy
    @competency.destroy
    respond_to do |format|
      format.html { redirect_to competencies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competency
      @competency = Competency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competency_params
      params.require(:competency).permit(:name)
    end
end