class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.belongs_to :contest
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
