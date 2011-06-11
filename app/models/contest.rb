class Contest < ActiveRecord::Base
  has_many :photos
  has_many :rounds
end
