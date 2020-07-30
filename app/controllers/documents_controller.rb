class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def show
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @profile = Profile.find(params[:profile_id])
    @document = @profile.documents.new(document_params)
    respond_to do |format|
      if @document.save
        format.js
      else
        format.html { redirect_to profile_path(@profile) }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to profile_path(@profile), notice: 'Document was successfully updated.' }
      else
        format.html { redirect_to profile_path(@profile), notice: 'Document was failed to updated.' }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    image_path = File.join(Rails.root, 'public', params["data"])
    File.delete(image_path) if File.exist?(image_path)
    pic_array = @document["docs"]
    image_name = params["data"].split('/').last
    pic_array.delete(image_name) if pic_array.include?(image_name)
    @document.save   
    @profile.save
    
    redirect_to profile_path(@profile), notice: 'Document was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
      @profile = Profile.find(params[:profile_id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit({docs: []})
    end
end
