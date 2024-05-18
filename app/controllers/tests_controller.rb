class TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy results ]
  before_action :set_subject

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)
    @test.subject_id = Glossary.find(params[:test][:glossary_id]).subject.id

    respond_to do |format|
      if @test.save
        format.html { redirect_to subject_tests_path, notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to test_url(@test), notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def results
    
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      if params[:id]
        @test = Test.find(params[:id])
      else
        @test = Test.find(params[:test_id])
      end
    end

  def set_subject
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
  end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:subject_id, :glossary_id, :question_amount, :last_answered, :is_finished)
    end
end
