class AddMetadataToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :title, :string
    add_column :photos, :extended_description, :text
  end

  def self.down
    remove_column :photos, :extended_description
    remove_column :photos, :title
  end
end
