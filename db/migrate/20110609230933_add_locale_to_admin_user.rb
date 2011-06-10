class AddLocaleToAdminUser < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :locale, :string
  end

  def self.down
    remove_column :admin_users, :locale
  end
end
