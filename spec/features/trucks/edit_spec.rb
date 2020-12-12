require "rails_helper"

RSpec.describe "Edit truck page" do

  it "can edit truck" do 
    list = List.create!(name: "My List", password: "123", password_confirmation: "123")
    truck1 = list.trucks.create!(unit_number: "345432", unit_type: 4)
    truck2 = list.trucks.create!(unit_number: "9163462", unit_type: 3)
    truck3 = list.trucks.create!(unit_number: "345000", unit_type: 7)
    allow_any_instance_of(ApplicationController).to receive(:current_list).and_return(list)
    visit "/trucks/#{truck1.id}/edit"
    fill_in :unit_number, with: "123456"
    select "Day Cab", :from => "unit_type"
    select "In Progress", :from => "status"
    click_on "Submit"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("123456")
    expect(page).to have_content("Day Cab")
    expect(Truck.find(truck1.id).unit_number).to eq("123456")
    expect(Truck.find(truck1.id).unit_type).to eq("Day Cab")
  end

end