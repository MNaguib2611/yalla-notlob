json.extract! user_friend, :id, :email, :created_at, :updated_at
json.url user_friend_url(user_friend, format: :json)
