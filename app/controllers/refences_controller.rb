class RefencesController < ApplicationController
  before_action :set_refence, only: [:show, :edit, :update, :destroy]

  # GET /refences
  # GET /refences.json
  def index
    @refences = Refence.all
  end

  # GET /refences/1
  # GET /refences/1.json
  def show
  end

  # GET /refences/new
  def new
    @refence = Refence.new
  end

  # GET /refences/1/edit
  def edit
  end

  # POST /refences
  # POST /refences.json
  def create
    @refence = Refence.new(refence_params)

    respond_to do |format|
      if @refence.save
        format.html { redirect_to @refence, notice: 'Refence was successfully created.' }
        format.json { render action: 'show', status: :created, location: @refence }
      else
        format.html { render action: 'new' }
        format.json { render json: @refence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refences/1
  # PATCH/PUT /refences/1.json
  def update
    respond_to do |format|
      if @refence.update(refence_params)
        format.html { redirect_to @refence, notice: 'Refence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @refence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refences/1
  # DELETE /refences/1.json
  def destroy
    @refence.destroy
    respond_to do |format|
      format.html { redirect_to refences_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refence
      @refence = Refence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refence_params
      params[:refence]
    end
end
