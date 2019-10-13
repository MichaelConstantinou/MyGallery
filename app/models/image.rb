class Image < ApplicationRecord
  validates_presence_of :name, :cover_image
  belongs_to :gallery
end
