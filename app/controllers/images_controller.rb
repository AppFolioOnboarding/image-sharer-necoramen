class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

  def show_by_tag
    @tag = params[:tag]
    @images = Image.tagged_with(@tag)
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  def index
    redirect_to root_path
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
