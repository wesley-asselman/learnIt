class GlossariesController < ApplicationController
  before_action :set_glossary, only: %i[ show edit update destroy ]
  before_action :set_subject

  # GET /glossaries or /glossaries.json
  def index
    @glossaries = @subject.glossaries
  end

  # GET /glossaries/1 or /glossaries/1.json
  def show
    @timeline = @glossary.timeline
  end

  # GET /glossaries/new
  def new
    @glossary = Glossary.new
  end

  # GET /glossaries/1/edit
  def edit
  end

  # POST /glossaries or /glossaries.json
  def create
    @glossary = @subject.glossaries.create(glossary_params)

    respond_to do |format|
      if @glossary.save
        format.html { redirect_to subject_glossary_path(id: @glossary.id), notice: "Glossary was successfully created." }
        format.json { render :show, status: :created, location: @glossary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /glossaries/1 or /glossaries/1.json
  def update
    respond_to do |format|
      if @glossary.update(glossary_params)
        format.html { redirect_to glossary_url(@glossary), notice: "Glossary was successfully updated." }
        format.json { render :show, status: :ok, location: @glossary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glossaries/1 or /glossaries/1.json
  def destroy
    @glossary.destroy

    respond_to do |format|
      format.html { redirect_to glossaries_url, notice: "Glossary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glossary
      @glossary = Glossary.find(params[:id])
    end
    
    def set_subject
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
      end
    end

    # Only allow a list of trusted parameters through.
    def glossary_params
      params.require(:glossary).permit(:title)
    end
end
