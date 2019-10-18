class Gallery < ApplicationRecord
	validates :name, presence: true

	belongs_to :user
	has_many :images, dependent: :destroy

	mount_uploader :cover_image, ImageUploader
end
