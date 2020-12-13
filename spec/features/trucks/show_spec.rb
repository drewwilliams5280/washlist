require "rails_helper"

RSpec.describe "Show truck page" do

  it "it lists truck details" do 
    list = List.create!(name: "My List", password: "123", password_confirmation: "123")
    truck1 = list.trucks.create!(unit_number: "345432", unit_type: 4)
    truck2 = list.trucks.create!(unit_number: "9163462", unit_type: 3)
    truck3 = list.trucks.create!(unit_number: "345000", unit_type: 7)
    allow_any_instance_of(ApplicationController).to receive(:current_list).and_return(list)
    visit "/trucks/#{truck1.id}"
    expect(page).to have_content(truck1.unit_number)
    expect(page).to have_content(truck1.unit_type)
    expect(page).to have_content(truck1.status)
  end

  it "it has link to edit truck" do 
    list = List.create!(name: "My List", password: "123", password_confirmation: "123")
    truck1 = list.trucks.create!(unit_number: "345432", unit_type: 4)
    truck2 = list.trucks.create!(unit_number: "9163462", unit_type: 3)
    truck3 = list.trucks.create!(unit_number: "345000", unit_type: 7)
    allow_any_instance_of(ApplicationController).to receive(:current_list).and_return(list)
    visit "/trucks/#{truck1.id}"
    expect(page).to have_link("Edit")
    click_on "Edit"
    expect(current_path).to eq("/trucks/#{truck1.id}/edit")
  end

  it "it has link to delete truck" do 
    list = List.create!(name: "My List", password: "123", password_confirmation: "123")
    truck1 = list.trucks.create!(unit_number: "345432", unit_type: 4)
    truck2 = list.trucks.create!(unit_number: "9163462", unit_type: 3)
    truck3 = list.trucks.create!(unit_number: "345000", unit_type: 7)
    allow_any_instance_of(ApplicationController).to receive(:current_list).and_return(list)
    visit "/trucks/#{truck1.id}"
    expect(page).to have_link("Delete")
    click_on "Delete"
    expect(current_path).to eq("/dashboard")
    expect(page).to_not have_content(truck1.unit_number)
  end
end