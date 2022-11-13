class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to list_path(:list_id)
  end
end
