class FramedpModelsController < ApplicationController
  # GET /framedp_models
  # GET /framedp_models.json
  def index
    @framedp_models = FramedpModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @framedp_models }
    end
  end

  # GET /framedp_models/1
  # GET /framedp_models/1.json
  def show
    @framedp_model = FramedpModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @framedp_model }
    end
  end

  # GET /framedp_models/new
  # GET /framedp_models/new.json
  def new
    @framedp_model = FramedpModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @framedp_model }
    end
  end

  # GET /framedp_models/1/edit
  def edit
    @framedp_model = FramedpModel.find(params[:id])
  end

  # POST /framedp_models
  # POST /framedp_models.json
  def create
    @framedp_model = FramedpModel.new(params[:framedp_model])

    respond_to do |format|
      if @framedp_model.save
        format.html { redirect_to @framedp_model, notice: 'Framedp model was successfully created.' }
        format.json { render json: @framedp_model, status: :created, location: @framedp_model }
      else
        format.html { render action: "new" }
        format.json { render json: @framedp_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /framedp_models/1
  # PUT /framedp_models/1.json
  def update
    @framedp_model = FramedpModel.find(params[:id])

    respond_to do |format|
      if @framedp_model.update_attributes(params[:framedp_model])
        format.html { redirect_to @framedp_model, notice: 'Framedp model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @framedp_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /framedp_models/1
  # DELETE /framedp_models/1.json
  def destroy
    @framedp_model = FramedpModel.find(params[:id])
    @framedp_model.destroy

    respond_to do |format|
      format.html { redirect_to framedp_models_url }
      format.json { head :no_content }
    end
  end
end
