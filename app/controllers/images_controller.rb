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
      redirect_to @image, success: 'You have successfully added an image.'
    else
      render :new
    end
  end

  def index
    @tag = params[:tag]
    @images = @tag.nil? ? Image.all : Image.tagged_with(@tag)
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path, success: 'You have successfully deleted the image.'
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
