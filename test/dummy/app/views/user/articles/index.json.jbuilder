json.resources do
  json.array! @articles, partial: 'user/articles/article_for_list', as: :article
end
json.count @count