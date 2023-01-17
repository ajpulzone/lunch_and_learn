require "rails_helper"

RSpec.describe User do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_uniqueness_of :user_api_key }
  end

  describe "relationships" do
    it { should have_many :favorites }
  end

  describe "class methods" do
    xdescribe "#create_api_key" do
      it "NEEDS TO BE STUBBED OR SOMETHING, EMAIL IS NOT UNIQUE SO ONLY PASSES ONCE: creates a user_api_key upon creation of a user" do
      user = User.create!(name: "Pudding", email: "pudding@gmail.com")
      binding.pry
      expect(user.user_api_key).to be_a(String)
      end
    end
  end 
end
