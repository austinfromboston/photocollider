class Round < ActiveRecord::Base
  belongs_to :contest
  has_many :round_participations
  has_many :photos, :through => :round_participations
  has_many :votes

  scope :active, where(:active => true)
  accepts_nested_attributes_for :round_participations

  validate :name, :presence => true, :uniqueness => true, :scope => :contest_id

end
