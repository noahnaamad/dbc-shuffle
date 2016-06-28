class Student < ActiveRecord::Base
  has_many :pairs
  has_one :cohort, {through: :Group}
  belongs_to :group
end
