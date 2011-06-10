class Photo < ActiveRecord::Base
  belongs_to :contest
  belongs_to :submitter, :class_name => 'User', :foreign_key => 'user_id'
  has_many :votes

  has_attached_file :image, :styles => { :medium => "800x1000>", :thumb => "150x150>" }
end
