class HomeController < ApplicationController
  def index
    
    @all_images = Image.paginate(page: params[:page], per_page: 9).order(id: :desc).all
  end
end
