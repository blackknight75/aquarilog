require 'rails_helper'

describe "when user visits the user new page" do
  scenario "they fill out and create new user" do
    visit new_user_path

    fill_in "First Name", with: "Dan"
    fill_in "Last Name", with: "Olson"
    fill_in "Email", with: "tatooine@gmail.com"
    fill_in "Username", with: "dolson"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    click_on "Create User"
    expect(page).to have_current_path user_path(User.last)
    expect(page).to have_content("Welcome Dan Olson")
  end
end
