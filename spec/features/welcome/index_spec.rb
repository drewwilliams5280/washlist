require "rails_helper"

RSpec.describe "As a user" do
  it "can visit the welcome/root page" do
    visit root_path
    expect(current_path).to eq("/")
  end
  
  it "can navigate to create a wash list" do
    visit root_path
    expect(page).to have_link("Sign up")
    click_link("Sign up")
    expect(current_path).to eq("/list/new")
  end
  
  it "can fill in form and be logged in" do
    List.create!(name: "My List", password: "123", password_confirmation: "123")
    visit root_path
    fill_in :name, with: "My List"
    fill_in :password, with: "123"
    click_on "Log In"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Successfully logged in")
    expect(page).to have_content("My List")
  end

  it "can fill in form with incorrect password credentials and get correct flash message and redirect" do
    List.create!(name: "My List", password: "123", password_confirmation: "123")
    visit root_path
    fill_in :name, with: "My List"
    fill_in :password, with: "1234"
    click_on "Log In"
    expect(current_path).to eq("/")
    expect(page).to have_content("Your credentials are incorrect")
    expect(page).to have_content("Welcome to WashList!")
  end

  it "can fill in form with name that doesn't exist and get correct flash message and redirect" do
    List.create!(name: "My List", password: "123", password_confirmation: "123")
    visit root_path
    fill_in :name, with: "Best List"
    fill_in :password, with: "123"
    click_on "Log In"
    expect(current_path).to eq("/")
    expect(page).to have_content("Your credentials are incorrect")
    expect(page).to have_content("Welcome to WashList!")
  end
end