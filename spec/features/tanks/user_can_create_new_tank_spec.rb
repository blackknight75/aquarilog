require 'rails_helper'

describe "when a user vists the tank new page" do
  scenario "they fill in a form, submit and redirected to new tank show page" do
    user = User.create!(first_name: "Bob", last_name: "Vila", username: "thisoldhouse@gmail.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_user_tank_path(user)

    fill_in "tank[name]", with: "Shrimp Tank"
    fill_in "tank[dimensions]", with: "2x2x2"
    fill_in "tank[gallons]", with: "200"
    click_on "Create Tank"

    expect(page).to have_current_path user_path(user)
    expect(page).to have_content("Shrimp Tank")
    expect(page).to have_content("200")
  end
end
