class AddAttachmentProfilePictureToEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.attachment :profile_picture
    end
  end

  def self.down
    remove_attachment :employees, :profile_picture
  end
end
