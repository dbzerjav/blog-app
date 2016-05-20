json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :user_id, :friend_id, :approved, :friend_name, :user_name
  json.url friendship_url(friendship, format: :json)
end
