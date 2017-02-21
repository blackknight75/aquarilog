require 'rails_helper'

describe 'when a user visits fish edit page' do
  scenario 'they alter a form and submit' do
    breed = Breed.create(name: "Comet", temperament: "Community")
    user = User.create!(first_name: "Bob", last_name: "Vila", username: "thisoldhouse@gmail.com", password: "password")
    tank = user.tanks.create(name: "Super Reef", dimensions: "2x2x2", gallons: 20)
    fish = tank.fish.create(name: "Comet", purchase_date: "01/01/2017", purchase_store: "PetSmart", cost: 3.99, tank_id: tank.id, breed_id: breed.id, fish_image: "http://www.firstaidforfree.com/wp-content/uploads/2015/02/FISHSHAPED.png" )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_tank_fish_path(tank, fish)
    expect(page).to have_selector("input[value='Comet']")

    fill_in 'fish[name]', with: "Jonny"
    click_on "Save Fish"

    expect(page).to have_content("Jonny")
    expect(page).not_to have_content("Comet")
  end
end
