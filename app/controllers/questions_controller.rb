class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def choose_competency
    @competencies = Competency.all
  end

  def view
    @competency = Competency.find(params[:competency_id])
    # replace with questions model scope
    @questions = Question.joins(:indicators).joins("INNER JOIN competencies ON indicators.competency_id = competencies.id").where('competencies.id = ?', @competency.id).paginate(page: params[:page], per_page: 5)
    @indicators = Indicator.by_competency(@competency.name)
    @indicator_question = IndicatorQuestion.new
  end

  def toggle_active
    @question = Question.find(params[:id])
    @question.toggle :active
    @question.save
    redirect_to :back
  end

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new
    @question.question = params[:indicator_question][:question]

    respond_to do |format|
      if @question.save
        @indicator_question = IndicatorQuestion.new
        @indicator_question.question = @question
        @indicator_question.indicator = Indicator.find(params[:indicator_question][:indicator])
        if @indicator_question.save
          format.html { redirect_to :back, notice: 'Question was successfully created.' }
          format.json { render action: 'view', status: :created, location: @question }
        else
          format.html { render action: 'view' }
          format.json { render json: @indicator_question.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: 'view' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :active)
    end
end
