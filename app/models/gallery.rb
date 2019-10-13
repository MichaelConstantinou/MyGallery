class Gallery < ApplicationRecord
    validates_presence_of :url
    belongs_to :user
    has_many :images
end
