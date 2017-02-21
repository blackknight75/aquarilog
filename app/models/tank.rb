class Tank < ActiveRecord::Base
  belongs_to :user
  has_many :fish

  def fish_count
    self.fish.count
  end

end
