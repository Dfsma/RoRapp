class Image < ApplicationRecord
    after_create :send_new_post_email
    mount_uploader :picture, PictureUploader
    validates :description, presence: true 
    belongs_to :user
    has_many :comments, dependent: :destroy
    acts_as_votable

    private
    def send_new_post_email
    ImageMailer.image_notification(self).deliver
    end
end
