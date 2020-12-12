require 'rails_helper'

RSpec.describe Truck, type: :model do
  
  describe "validations" do
    it {should validate_presence_of :unit_number}
  end

  describe "relationships" do
    it {should have_many :notes}
    it {should belong_to :list}
  end

  describe "creation" do
    it "can create a truck" do
      list = List.create!(name: "Super best list", password: "123", password_confirmation: '123')
      truck = Truck.create!(list_id: list.id, unit_number: "497656", unit_type: 7)
      expect(truck).to be_a(Truck)
      expect(truck.unit_number).to eq("497656")
      expect(truck.unit_type).to eq("Sleeper")
      expect(truck.status).to eq("Not Started")
    end
  end

end
