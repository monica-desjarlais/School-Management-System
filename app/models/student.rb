class Student < ApplicationRecord

  validates :name, presence: true, length: {minimum: 5, maximum: 50}

  before_save {self.email = email.downcase} #set the email to lowercase, before saving it to db

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   #valid email format, stored in a constant

  validates :email, presence: true, length: { maximum: 105 },

  uniqueness: { case_sensitive: false }, #it's case sensitive

  format: { with: VALID_EMAIL_REGEX }  #will check for valid email format

  has_secure_password

  has_many :student_courses

  has_many :courses, through: :student_courses

end
