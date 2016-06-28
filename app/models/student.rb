class Student < ActiveRecord::Base
  has_many :pairs
  belongs_to :group
end
