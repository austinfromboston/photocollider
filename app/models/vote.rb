class Vote < ActiveRecord::Base
  belongs_to :voter, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :photo
  belongs_to :round

  validate :user_id, :photo_id, :round_id, :presence => true
  validate :user_id, :uniqueness => true, :scope => :photo_id
end
