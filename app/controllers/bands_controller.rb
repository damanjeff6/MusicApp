class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def show
    @bands = Band.find(params[:id])
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(params[:band])

    if @band.save
      redirect_to band_url(@band)
    else
      @error_messages = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update_attributes(params[:band])
      redirect_to band_url(@band)
    else
      @error_messages = @band.errors.full_messages
      render :edit
    end
  end

  def destroy

  end

end
