class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update, :destroy, :destroy_image]

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_image
    image_path = File.join(Rails.root, 'public', params["data"])
    File.delete(image_path) if File.exist?(image_path)
    pic_array = @profile["picture"]
    image_name = params["data"].split('/').last
    pic_array.delete(image_name) if pic_array.include?(image_name)
    @profile.save
    redirect_to profile_path(@profile), notice: 'Document was successfully destroyed.'
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:name, {picture: []})
    end
end
