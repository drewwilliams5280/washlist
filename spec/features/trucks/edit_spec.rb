# require "rails_helper"

# RSpec.describe "Edit truck page" do

#   it "can click on truck number to be taken to edit" do 
#     list = List.create!(name: "My List", password: "123", password_confirmation: "123")
#     truck1 = list.trucks.create!(unit_number: "345432", unit_type: 4)
#     truck2 = list.trucks.create!(unit_number: "9163462", unit_type: 3)
#     truck3 = list.trucks.create!(unit_number: "345000", unit_type: 7)
#     allow_any_instance_of(ApplicationController).to receive(:current_list).and_return(list)
#     visit '/dashboard'
#     click_on "345432"
#     expect(current_path).to eq("/trucks/#{truck1.id}")
#   end

# end