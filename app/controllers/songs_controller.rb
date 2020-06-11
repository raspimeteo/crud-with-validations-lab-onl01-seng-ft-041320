require 'pry'
class SongsController < ApplicationController

    before_action :find_song, only: [:show, :edit, :update, :destroy]
    def index
        @songs = Song.all
    end

    def show
    end

    def create
        @song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
        
        if @song.save
          flash[:success] = "Song successfully created"
          redirect_to @song
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @song.update_attributes(song_params(:title, :released, :release_year, :artist_name, :genre))
          flash[:success] = "Song was successfully updated"
          redirect_to @song
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def new
        @song = Song.new
    end
    
    def destroy
        # @song = Song.find(params[:id])
        if @song.destroy
            flash[:success] = 'Song was successfully deleted.'
            redirect_to songs_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to songs_url
        end
    end
    
    
    
    
    
    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end

    def find_song
        @song = Song.find(params[:id])
    end
    
end
