class ImagesController < ApplicationController
    respond_to :js, :html, :json
    load_and_authorize_resource param_method: :image_params

    before_action :set_image, only: [:show, :edit, :update, :destroy]
    
    

    def index
        if user_signed_in?
        @images = Image.order(id: :desc).where user_id: current_user.id
        end
        
        @all_images = Image.order(id: :desc).all
    end
    
    def new 
        @image = Image.new   
    end

    def create
        @image = current_user.images.new image_params
        if @image.save
            ImageMailer.with(image: @image).image_notification.deliver
            return redirect_to images_path
        end

        render :new
    end

    def show
    
    end

    def edit
    end

    def update
        
        @image.update image_params
      
        redirect_to images_path
    end

    def destroy
        @image.destroy
        redirect_to images_path
    end

    def like
        
        if current_user.voted_for? @image
            @image.unliked_by current_user
        else
            @image.liked_by current_user
        end
        redirect_to image_path(@image)

       
    end  
    
    
    private    
    def image_params
        params.require(:image).permit :description, :picture
    end

    def set_image
        @image = Image.find params[:id]
    end

    
end
