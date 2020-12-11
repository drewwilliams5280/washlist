require "rails_helper"

RSpec.describe "As a user" do
  it "can visit the welcome/root page" do
    visit root_path
    expect(current_path).to eq("/")
  end
  
  it "can navigate to create a wash list" do
    visit root_path
    expect(page).to have_link("Create a new WashList")
    click_link("Create a new WashList")
    expect(current_path).to eq("/list/new")
  end
end