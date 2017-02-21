require 'rails_helper'

  describe 'when a user visits the new breed page' do
    scenario 'they fill out a form and submit new breed' do
      user = User.create!(first_name: "Bob", last_name: "Vila", username: "thisoldhouse@gmail.com", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_breed_path

      fill_in 'breed[name]', with: "Tetra"
      fill_in 'breed[temperament]', with: "Community"
      click_on "Create Breed"

      expect(current_path).to eq breed_path(Breed.last)
      expect(page).to have_content("Tetra")
      expect(page).to have_content("Community")
    end
  end
