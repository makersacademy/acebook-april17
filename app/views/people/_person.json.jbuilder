json.extract! person, :id, :email, :password, :created_at, :updated_at
json.url person_url(person, format: :json)
