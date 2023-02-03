json.array!(@user.posts) do |post|
  json.id post.id
  json.title post.title
  json.text post.text
  json.author do
    json.id post.author.id
    json.name post.author.name
    json.email post.author.email
  end
  json.comments post.comments do |comment|
    json.author comment.author.name
    json.body comment.text
  end
end
