class SongsController < ApplicationController
  def index
    @songs=Song.all
  end

  def show
    @song=Song.find(params[:id])
  end

  def edit
    @song=Song.find(params[:id])
  end

  def update
    @song=Song.find(params[:id])
    if @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def new
    @song=Song.new
  end

  def create
    @song=Song.new(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
    @song.save
    redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

end
