require "rails_helper"

RSpec.describe "As a user" do
  it "gives 401 if not signed int" do
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
end