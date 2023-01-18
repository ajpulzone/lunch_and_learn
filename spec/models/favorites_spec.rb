require "rails_helper"

RSpec.describe Favorite do
  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :user_api_key }
    it { should validate_presence_of :country }
    it { should validate_presence_of :recipe_link }
    it { should validate_presence_of :recipe_title }
  end

  describe "relationships" do
    it { should belong_to :user }
  end
end
