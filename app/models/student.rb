class Student < ActiveRecord::Base
  has_many :pairs
  has_one :cohort, {through: :Cohort}
  belongs_to :group
end
