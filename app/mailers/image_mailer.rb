class ImageMailer < ApplicationMailer
    default from: 'notifications@community.com'

    def image_notification
        @image = params[:image]
        @user = params[:user]
       
        mail(to: 'diegof.df58@gmail.com', subject: 'Someone create a post!')
    end
end
