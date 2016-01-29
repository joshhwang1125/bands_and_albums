class TracksController < ApplicationController
  before_action :force_log_in

  def new
  end

  def create
  end

  def show
    @track = Track.find(params[:id])
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = TracksController.find(params[:id])
    @track.destroy
    flash.notice = "Track '#{@track.name}' Destroyed!"
    redirect_to bands_url
  end

  private
  def track_params
    params.require(:track).permit(:name, :track_style)
  end
end
