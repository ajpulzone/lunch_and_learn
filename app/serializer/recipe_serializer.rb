class CountryRecipeSerializer
  include JSONAPI::Serializer

  set_id {nil}
  attributes :title, :url, :country, :image_url, :type
end