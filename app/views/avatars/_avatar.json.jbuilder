json.extract! avatar, :id, :username, :image, :created_at, :updated_at
json.url avatar_url(avatar, format: :json)
