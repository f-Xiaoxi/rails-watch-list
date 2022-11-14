class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @list = List.find(params[:list_id])

  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    bookmark = Bookmark.new(bookmark_create_params)
    bookmark.list = @list
    if bookmark.save
      redirect_to list_path(@list)
    else
      render json: ErrorSerializer.serialize(user.errors), status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def bookmark_create_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
