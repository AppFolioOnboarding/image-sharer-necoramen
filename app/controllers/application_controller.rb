class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @images = Image.all
  end
end
