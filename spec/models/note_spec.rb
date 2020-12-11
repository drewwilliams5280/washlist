require 'rails_helper'

RSpec.describe Note, type: :model do
  
  describe "validations" do
    it {should validate_presence_of :text}
  end

  describe "relationships" do
    it {should belong_to :truck}
  end

  describe "creation" do
    it "can create a note" do
      list = List.create!(name: "Super best list", password: "123", password_confirmation: '123')
      truck = Truck.create!(list_id: list.id, unit_number: "497656", unit_type: 7)
      note = Note.create!(truck_id: truck.id, text: "Roger Penske himself is picking up so pls clean real gud")
      expect(note).to be_a(Note)
      expect(note.text).to eq("Roger Penske himself is picking up so pls clean real gud")
      expect(note.truck).to eq(truck)
    end
  end

end
