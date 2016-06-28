class Group < ActiveRecord::Base
  belongs_to :cohort
  has_many :students
end
