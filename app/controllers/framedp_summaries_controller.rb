class FramedpSummariesController < ApplicationController
  # GET /framedp_summaries
  # GET /framedp_summaries.json
  def index
    @framedp_summaries = FramedpSummary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @framedp_summaries }
    end
  end

  # GET /framedp_summaries/1
  # GET /framedp_summaries/1.json
  def show
    @framedp_summary = FramedpSummary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @framedp_summary }
    end
  end

  # GET /framedp_summaries/new
  # GET /framedp_summaries/new.json
  def new
    @framedp_summary = FramedpSummary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @framedp_summary }
    end
  end

  # GET /framedp_summaries/1/edit
  def edit
    @framedp_summary = FramedpSummary.find(params[:id])
  end

  # POST /framedp_summaries
  # POST /framedp_summaries.json
  def create
    @framedp_summary = FramedpSummary.new(params[:framedp_summary])

    respond_to do |format|
      if @framedp_summary.save
        format.html { redirect_to @framedp_summary, notice: 'Framedp summary was successfully created.' }
        format.json { render json: @framedp_summary, status: :created, location: @framedp_summary }
      else
        format.html { render action: "new" }
        format.json { render json: @framedp_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /framedp_summaries/1
  # PUT /framedp_summaries/1.json
  def update
    @framedp_summary = FramedpSummary.find(params[:id])

    respond_to do |format|
      if @framedp_summary.update_attributes(params[:framedp_summary])
        format.html { redirect_to @framedp_summary, notice: 'Framedp summary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @framedp_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /framedp_summaries/1
  # DELETE /framedp_summaries/1.json
  def destroy
    @framedp_summary = FramedpSummary.find(params[:id])
    @framedp_summary.destroy

    respond_to do |format|
      format.html { redirect_to framedp_summaries_url }
      format.json { head :no_content }
    end
  end
end
