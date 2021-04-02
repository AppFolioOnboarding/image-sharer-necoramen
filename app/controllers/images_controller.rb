class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
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
    @tag = params[:tag]
    @images = @tag.nil? ? Image.all : Image.tagged_with(@tag)
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
