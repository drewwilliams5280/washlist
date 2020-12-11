require "rails_helper"

RSpec.describe "As a user" do
  it "can fill in form for creating a wash list" do
    visit '/list/new'
    fill_in :name, with: "Amazing list"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"
    click_on "Create WashList"
    expect(current_path).to eq('/dashboard')
  end
end

# <%= form_with method: :post, url: '/list' do |f| %>
#   <%= f.label :name %><br>
#   <%= f.text_field :name, required: true %><br>
#   <%= f.select :unit_type, @unit_types %><br><br>
#   <%= f.submit "Create WashList" %>
# <% end %>
# Putting here so I don't forget