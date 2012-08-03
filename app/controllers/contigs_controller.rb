class ContigsController < ApplicationController
  # GET /contigs
  # GET /contigs.json
  def index
    if params[:q].blank?
      @contigs = Contig.paginate(page: params[:page], per_page: 25)
    else
      @contigs = Contig.paginate(page: params[:page], per_page: 25,
        conditions: ["name = ?", params[:q]])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contigs }
    end
  end

  # GET /contigs/1
  # GET /contigs/1.json
  def show
    @contig = Contig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contig }
    end
  end

  # GET /contigs/new
  # GET /contigs/new.json
  def new
    @contig = Contig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contig }
    end
  end

  # GET /contigs/1/edit
  def edit
    @contig = Contig.find(params[:id])
  end

  # POST /contigs
  # POST /contigs.json
  def create
    @contig = Contig.new(params[:contig])

    respond_to do |format|
      if @contig.save
        format.html { redirect_to @contig, notice: 'Contig was successfully created.' }
        format.json { render json: @contig, status: :created, location: @contig }
      else
        format.html { render action: "new" }
        format.json { render json: @contig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contigs/1
  # PUT /contigs/1.json
  def update
    @contig = Contig.find(params[:id])

    respond_to do |format|
      if @contig.update_attributes(params[:contig])
        format.html { redirect_to @contig, notice: 'Contig was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contigs/1
  # DELETE /contigs/1.json
  def destroy
    @contig = Contig.find(params[:id])
    @contig.destroy

    respond_to do |format|
      format.html { redirect_to contigs_url }
      format.json { head :no_content }
    end
  end
end
