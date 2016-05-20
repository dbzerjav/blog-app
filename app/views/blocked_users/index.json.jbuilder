json.array!(@blocked_users) do |blocked_user|
  json.extract! blocked_user, :id, :user_id, :blocked_id, :blocked_username
  json.url blocked_user_url(blocked_user, format: :json)
end
