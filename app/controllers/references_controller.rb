class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]
  before_action :authorize!, except: [:index, :show]

  # GET /references
  # GET /references.json
  def index
    @references = Reference.all
  end

  # GET /references/1
  # GET /references/1.json
  def show
  end

  # GET /references/new
  def new
    if params[:entry_type] == "inproceedings"
      @reference = Reference.new(entry_type: params[:entry_type])
    else
      @reference = Reference.new(entry_type: params[:entry_type].singularize)
    end
  end

  # GET /references/1/edit
  def edit
  end

  # POST /references
  # POST /references.json
  def create
    @reference = Reference.new(reference_params)
    @reference.createID
    @reference.searchOptimize

    respond_to do |format|
      if @reference.save
        format.html { redirect_to @reference, notice: 'SUCCESS' }
        format.json { render action: 'show', status: :created, location: @reference }
      else
        format.html { render action: 'new', notice: 'FAIL' }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /references/1
  # PATCH/PUT /references/1.json
  def update
    respond_to do |format|
      if @reference.update_attributes(reference_params)

        #set new ID, searchOptimize and save
        @reference.createID
        @reference.searchOptimize
        @reference.save

        format.html { redirect_to @reference, notice: 'Reference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /references/1
  # DELETE /references/1.json
  def destroy
    @reference.destroy
    respond_to do |format|
      format.html { redirect_to references_url }
      format.json { head :no_content }
    end
  end

  def download
    ref = Reference.find(params[:id])
    send_data ref.specialChars(ref.to_bib),
    :filename => "reference.bib",
              :type => "text/plain"
  end
  
  def downloadAll
    refs = Reference.all
    data = ""
    refs.each do |reference|
      data << reference.specialChars(ref.to_bib) + "\n" + "\n"
      end
    
    #HUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOM
    #Tänne tarkistus notta onko useampi id ja jos on niin editoidaan numerot perään!!
    #HUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOMHUOM
    
      send_data data,
                :filename => "sigproc.bib",
                :type => "text/plain"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reference_params
      # params.require(:reference).permit(:entry_type, :entries, :user_id)
      params.require(:reference).tap do |allowed|
        allowed[:entries] = params[:reference][:entries]
      end
    end

    #set ref id
end
