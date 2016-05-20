json.array!(@comments) do |comment|
  json.extract! comment, :id, :username, :body, :article, :user
  json.url comment_url(comment, format: :json)
end
