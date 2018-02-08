class EvaluationsController < ApplicationController
  before_action :set_course 
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :set_grades, only: [:show]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations =@course.evaluations
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = @course.evaluations.new
      @course.students.each do |s| 
          @evaluation.grades.build(:student=> s)       
      end
  end


  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = @course.evaluations.new(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to [@course,@evaluation], notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: [@course,@evaluation] }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to [@course,@evaluation], notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: [@course,@evaluation] }
      elsif params[:evaluation][:grades_attributes].present?
        format.html { render :show }
        format.json { render json: @evaluation.errors}
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    respond_to do |format|
    if @evaluation.destroy
    
      format.html { redirect_to course_url(@course), notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    else
     
      format.html { render :show }
      format.json { render json: @evaluation.errors, status: :unprocessable_entity }
    end
  end
  end

  private
    def set_grades
      @course.students.each {|a| @evaluation.grades.find_or_create_by(student_id:a.id,evaluation_id:@evaluation.id)}
    end
    def set_course
	     @course= Course.find(params[:course_id])
    end 
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = @course.evaluations.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:name, :date, :min_grade, :course_id, grades_attributes: [:id, :student , :evaluation,:grade])
    end
end
