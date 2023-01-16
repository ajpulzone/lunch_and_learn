class RecipeSerializer
  include JSONAPI::Serializer

  set_id {nil}
  attributes :title, :url, :image_url, :country
end