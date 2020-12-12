require "rails_helper"

RSpec.describe "Dashboard" do
  it "gives 401 if not signed in" do
    visit '/dashboard'
    expect(page).to have_content('You are not authorized to view this page.')
  end

  it "redirects to dashboard and shows list name after creating list" do
    visit '/list/new'
    fill_in :name, with: "Amazing list"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"
    click_on "Create WashList"
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Amazing list')
  end

  it "displays message that the list doesn't have trucks if list has no trucks" do 
    visit '/list/new'
    fill_in :name, with: "Amazing list"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"
    click_on "Create WashList"
    expect(page).to have_content("You haven't added any trucks yet.")
  end

  it "lists trucks as table if washlist has trucks" do 
    list = List.create!(name: "My List", password: "123", password_confirmation: "123")
    truck1 = list.trucks.create!(unit_number: "345432", unit_type: 4)
    truck2 = list.trucks.create!(unit_number: "9163462", unit_type: 3)
    truck3 = list.trucks.create!(unit_number: "345000", unit_type: 7)
    allow_any_instance_of(ApplicationController).to receive(:current_list).and_return(list)
    visit '/dashboard'
    expect(page).to have_content("Unit Number")
    expect(page).to have_content("Unit Type")
    expect(page).to have_content(truck1.unit_number)
    expect(page).to have_content(truck1.unit_type)
    expect(page).to have_content(truck2.unit_number)
    expect(page).to have_content(truck2.unit_type)
    expect(page).to have_content(truck3.unit_number)
    expect(page).to have_content(truck3.unit_type)
    expect(page).to_not have_content("You haven't added any trucks yet.")
  end

  it "can add truck via a link called 'Add Truck'" do 
    list = List.create!(name: "My List", password: "123", password_confirmation: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_list).and_return(list)
    visit '/dashboard'
    expect(page).to have_link("Add Truck")
    click_on "Add Truck"
    expect(current_path).to eq("/trucks/new")
    fill_in :unit_number, with: "321321"
    select "High Roof Panel Van", :from => "unit_type"
    fill_in :note, with: "Customer coming at noon!"
    click_on "Add Truck to WashList"
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('321321')
  end
end