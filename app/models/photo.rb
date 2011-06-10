class Photo < ActiveRecord::Base
  belongs_to :contest
  belongs_to :submitter, :class_name => 'User'

  has_attached_file :image
end
