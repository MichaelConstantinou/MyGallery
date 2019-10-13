json.extract! gallery, :id, :name, :cover_image, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
