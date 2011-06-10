class Vote < ActiveRecord::Base
  belongs_to :voter, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :photo

  validate :user_id, :photo_id, :presence => true
  validate :user_id, :uniqueness => true, :scope => :photo_id
end
