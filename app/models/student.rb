class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  has_and_belongs_to_many :parents

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :parents
end
