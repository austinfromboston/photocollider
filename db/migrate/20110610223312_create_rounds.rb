class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.belongs_to :contest
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
