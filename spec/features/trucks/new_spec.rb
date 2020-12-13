require "rails_helper"

RSpec.describe "New truck page" do

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