require 'rails_helper'

describe 'when a user visits the new fish page' do
  scenario 'user fills in a form and clicks create fish' do
    Breed.create(name: "Comet", temperament: "Community")
    user = User.create!(first_name: "Bob", last_name: "Vila", username: "thisoldhouse@gmail.com", password: "password")
    tank = user.tanks.create(name: "Super Reef", dimensions: "2x2x2", gallons: 20)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_tank_fish_path(tank.id)

    fill_in "fish[name]", with: "Betsy"
    fill_in "fish[purchase_date]", with: "01/01/2017"
    fill_in "fish[purchase_store]", with: "PetSmart"
    fill_in "fish[cost]", with: 2.99
    find('#fish_breed_id').find(:xpath, 'option[1]').select_option
    click_on "Add Fish to Tank"

    expect(page).to have_current_path tank_path(tank)
    expect(page).to have_content("Betsy")
    expect(page).to have_content("Comet")
  end
end
