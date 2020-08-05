class Image < ApplicationRecord
    
    mount_uploader :picture, PictureUploader
    validates :description, presence: true 
    belongs_to :user
    has_many :comments, dependent: :destroy
    

end
