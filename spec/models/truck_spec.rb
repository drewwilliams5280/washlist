require 'rails_helper'

RSpec.describe Truck, type: :model do
  
  describe "validations" do
    it {should validate_presence_of :unit_number}
  end

  describe "creation" do
    it "can create a truck" do
      truck = Truck.create!(unit_number: "497656", unit_type: 7)
      expect(truck).to be_a(Truck)
      expect(truck.unit_number).to eq("497656")
      expect(truck.unit_type).to eq("Sleeper")
    end
  end

end
