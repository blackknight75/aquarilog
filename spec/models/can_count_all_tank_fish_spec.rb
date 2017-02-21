require 'rails_helper'

describe Tank do
  describe ".fish_count" do
    it 'returns fish count for individual tank' do
      breed = Breed.create!(name: "Cichlid", temperament: "Aggressive")
      user = User.create!(first_name: "Bob",
                          last_name: "Vila",
                          username: "thisoldhouse@gmail.com",
                          password: "password"
                         )
      tank1 = user.tanks.create(name: "Super Reef",
                                dimensions: "2x2x2",
                                gallons: 20)
      tank2 = user.tanks.create(name: "Other Tank",
                                dimensions: "2x2x2",
                                gallons: 20)
      3.times { tank1.fish.create(name: "Billy",
                                 breed_id: breed.id,
                                #  temperament: "Lackadaisical",
                                 purchase_date: "02/01/2017",
                                 purchase_store: "PetSmart",
                                 tank_id: tank1
                                )
              }
      tank2.fish.create(name: "Berny",
                                 breed_id: breed.id,
                                #  temperament: "Lackadaisical",
                                 purchase_date: "02/01/2017",
                                 purchase_store: "PetSmart",
                                 tank_id: tank2
                                )

      expect(tank1.fish_count).to eq(3)
      expect(tank2.fish_count).to eq(1)
    end
  end
end
