require "rails_helper"

RSpec.describe "As a user" do
  it "can fill in form for creating a wash list and create list" do
    visit '/list/new'
    fill_in :name, with: "Amazing list"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"
    click_on "Create WashList"
    expect(current_path).to eq('/dashboard')
    expect(List.first.name).to eq("Amazing list")
  end
end