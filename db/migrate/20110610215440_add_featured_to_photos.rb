class AddFeaturedToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :featured, :boolean
  end

  def self.down
    remove_column :photos, :featured
  end
end
