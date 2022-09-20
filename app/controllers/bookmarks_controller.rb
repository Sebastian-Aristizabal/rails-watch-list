class BookmarksController < ApplicationController

  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]

  def new
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to lists_path, status: :see_other
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
