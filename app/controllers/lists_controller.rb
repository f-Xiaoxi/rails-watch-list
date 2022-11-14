class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])


  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_create_params)
    if list.save
      redirect_to lists_path(@lists)
    else
      render json: ErrorSerializer.serialize(user.errors), status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_create_params
    params.require(:list).permit(:name, :url)
  end
end
