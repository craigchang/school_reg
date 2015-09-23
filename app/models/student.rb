class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  has_and_belongs_to_many :parents
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :parents, :allow_destroy => true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true
  validates :home_phone_number, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "must be in the format xxx-xxx-xxxx" }
  validates :cell_phone_number, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "must be in the format xxx-xxx-xxxx" }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: 'must be in the format xxx@xxx.xxx.' }

end
