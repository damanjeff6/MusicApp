class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @albums = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(params[:album])

    if @album.save
      redirect_to album_url(@album)
    else
      @error_messages = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      redirect_to album_url(@album)
    else
      @error_messages = @album.errors.full_messages
      render :edit
    end
  end

  def destroy

  end

end
