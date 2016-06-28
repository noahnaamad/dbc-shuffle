class Group < ActiveRecord::Base
  belongs_to :cohort #correct
  has_many :students
end
