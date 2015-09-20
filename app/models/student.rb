class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  has_and_belongs_to_many :parents

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :parents, :allow_destroy => true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true
  validates :home_phone_number, presence: true
  validates :cell_phone_number, presence: true
  validates :email, presence: true

end
