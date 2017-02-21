class Tank < ActiveRecord::Base
  belongs_to :user
  has_many :fish
  has_many :breeds, through: :fish

  def fish_count
    self.fish.count
  end

end
