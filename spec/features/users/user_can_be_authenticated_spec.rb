require 'rails_helper'

describe "authenticated Users" do
  it "user successfully logs in" do
    user = User.create!(first_name: "Bob", last_name: "Vila", username: "thebeard", email: "thisoldhouse@gmail.com", password: "password")

    visit root_path
    expect(current_path).to eq(login_path)
    fill_in "Username", with: "thebeard"
    fill_in "Password", with: "password"
    click_on "Log In"

    expect(page).to have_current_path user_path(user)
    expect(page).to have_content "Bob"
  end


  it "user visits restricted path and is redirected to log in" do

  end
end
