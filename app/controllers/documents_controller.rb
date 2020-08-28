class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @document = @profile.documents.new(document_params)

    respond_to do |format|
      if @document.save
        format.json { render json: @document, status: :created }
      else
        format.json { render json: @document.errors }
      end
    end
  end

  def update
    permit_params = params.require(:document).permit(:docs)
    respond_to do |format|
      if @document.update(permit_params)
        format.html { redirect_to profile_path(@profile), notice: 'Document was successfully updated.' }
      else
        format.html { redirect_to profile_path(@profile), notice: 'Document was failed to updated.' }
      end
    end
  end

  def destroy
    image_path = File.join(Rails.root, 'public', @document.docs.to_s)
    File.delete(image_path) if File.exist?(image_path)
    @document.destroy
    redirect_to profile_path(@profile), notice: 'Document was successfully destroyed.' 
  end

  private
    def set_document
      @document = Document.find(params[:id])
      @profile = Profile.find(params[:profile_id])
    end

    def document_params
      params.require(:document).permit(:docs)
    end
end
