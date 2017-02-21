class Breed < ActiveRecord::Base
has_many :fish
has_many :tanks, through: :fish
end
