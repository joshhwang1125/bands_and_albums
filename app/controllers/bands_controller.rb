class BandsController < ApplicationController
  before_action :force_log_in

  def index

  end

  def new
    @band = Band.new
  end

  def create
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    flash.notice = "Band '#{@band.name}' Deleted!"
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
