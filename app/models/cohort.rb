class Cohort < ActiveRecord::Base
  belongs_to :teacher
  has_many :groups
  has_many :students
end
