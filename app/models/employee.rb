class Employee < ActiveRecord::Base
  has_attached_file :profile_picture,
    styles: {
      medium: "80x80#",
      standard: "150x150#",
      large: "250x250#" },
    default_url: ":attachment/missing_:style.png"
  validates_attachment_content_type :profile_picture, content_type: %w(image/jpeg image/jpg image/png image/bmp)
end
