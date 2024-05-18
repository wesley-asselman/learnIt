class ConceptsController < ApplicationController
  before_action :set_concept, only: %i[ show edit update destroy ]
  before_action :set_glossary
  before_action :set_subject

  # GET /concepts or /concepts.json
  def index
    @concepts = Concept.all
  end

  # GET /concepts/1 or /concepts/1.json
  def show

  end

  # GET /concepts/new
  def new
    @glossary = Glossary.find(params[:glossary_id])
    @concept = Concept.new
  end

  # GET /concepts/1/edit
  def edit
    @glossary = Glossary.find(params[:glossary_id])
  end

  # POST /concepts or /concepts.json
  def create
    @concept = @glossary.concepts.create(concept_params)

    respond_to do |format|
      if @concept.save
        format.html { redirect_to subject_glossary_path(id: @glossary.id), notice: "Concept was successfully created." }
        format.json { render :show, status: :created, location: @concept }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concepts/1 or /concepts/1.json
  def update
    subject = Subject.find(params[:subject_id])

    respond_to do |format|
      if @concept.update(concept_params)
        format.html { redirect_to subject_glossary_path(id: @glossary.id), notice: "Concept was successfully updated." }
        format.json { render :show, status: :ok, location: @concept }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concepts/1 or /concepts/1.json
  def destroy
    @concept.destroy

    respond_to do |format|
      format.html { redirect_to subject_glossary_path(id: @glossary.id), notice: "Concept was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concept
      @concept = Concept.find(params[:id])
    end

    def set_subject
      @subject = Subject.find(params[:subject_id])
    end

    def set_glossary
      @glossary = Glossary.find(params[:glossary_id])
    end

    # Only allow a list of trusted parameters through.
    def concept_params
      params.require(:concept).permit(:page, :title, :explanation, :glossary_id, :note)
    end
end
