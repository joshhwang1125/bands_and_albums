class AlbumsController < ApplicationController
  before_action :force_log_in

  def new
    band = Band.find(params[:band_id])
    @album = Album.new(band_id: band.id)
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash.notice = "Album '#{@album.name}' Destroyed!"
    redirect_to bands_url

  end

  private
  def album_params
    params.require(:album).permit(:name, :album_style)
  end
end
