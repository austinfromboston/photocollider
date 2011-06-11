class CreateRoundParticipations < ActiveRecord::Migration
  def self.up
    create_table :round_participations do |t|
      t.belongs_to :photo
      t.belongs_to :round

      t.timestamps
    end
  end

  def self.down
    drop_table :round_participations
  end
end
