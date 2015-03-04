class Employee < ActiveRecord::Base
  has_attached_file :profile_picture,
    styles: {
      medium: "80x80#",
      standard: "150x150#",
      large: "250x250#" },
    default_url: ":attachment/missing_:style.png"
  validates_attachment_content_type :profile_picture, content_type: %w(image/jpeg image/jpg image/png image/bmp)

  validates :first_name, presence:true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :mobile_number, presence: true
  validates :email, presence:true, uniqueness: true
  validates :sss_number, presence: true, uniqueness: true
  validates :tin_number, presence: true, uniqueness: true
  validates :identification_number, presence: true, uniqueness: true
  validates :date_of_birth, presence: true
  validates :employee_type, presence: true

  belongs_to :employee_type
end

