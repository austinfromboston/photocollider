class AddJurorToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :juror, :boolean
  end

  def self.down
    remove_column :users, :juror
  end
end
