class TimelinesController < ApplicationController
  before_action :set_timeline, only: %i[ show edit update destroy ]
  before_action :set_glossary
  before_action :set_subject

  # GET /timelines or /timelines.json
  def index
    @timelines = Timeline.all
  end

  # GET /timelines/1 or /timelines/1.json
  def show
    @events = @timeline.events.order(year: :asc)
  end

  # GET /timelines/new
  def new
    @timeline = Timeline.new
  end

  # GET /timelines/1/edit
  def edit
  end

  # POST /timelines or /timelines.json
  def create
    
    glossary = Glossary.find(params[:glossary_id])
    @timeline = Timeline.new(timeline_params)

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to subject_glossary_path(glossary.subject, glossary), notice: "Timeline was successfully created." }
        format.json { render :show, status: :created, location: @timeline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelines/1 or /timelines/1.json
  def update
    respond_to do |format|
      if @timeline.update(timeline_params)
        format.html { redirect_to timeline_url(@timeline), notice: "Timeline was successfully updated." }
        format.json { render :show, status: :ok, location: @timeline }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelines/1 or /timelines/1.json
  def destroy
    @timeline.destroy

    respond_to do |format|
      format.html { redirect_to timelines_url, notice: "Timeline was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glossary
      @glossary = Glossary.find(params[:glossary_id])
    end
    
    def set_subject
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
      end
    end

    def set_timeline
      @timeline = Timeline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timeline_params
      params.permit(:glossary_id)
    end
end
