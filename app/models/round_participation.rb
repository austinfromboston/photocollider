class RoundParticipation < ActiveRecord::Base
  belongs_to :photo
  belongs_to :round
end
