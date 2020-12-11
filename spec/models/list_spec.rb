require 'rails_helper'

RSpec.describe List, type: :model do
  
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :password}
  end

  describe "relationships" do
    it {should have_many :trucks}
  end

  describe "creation" do
    it "can create a list" do
      list = List.create!(name: "Super best list", password: "123", password_confirmation: '123')
      expect(list).to be_a(List)
      expect(list.name).to eq("Super best list")
    end
  end

end
