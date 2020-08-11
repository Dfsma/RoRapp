class ImageMailer < ApplicationMailer
    default from: 'notifications@community.com'

    def image_notification(image)
        @image = image
        mail(to: 'diegof.df58@gmail.com', subject: 'Alguien creo un nuevo post!')
    end
end
