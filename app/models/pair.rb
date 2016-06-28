class Pair < ActiveRecord::Base
  belongs_to :stud1, {foreign_key: :stud1, class_name: "Student"}
  belongs_to :stud2, {foreign_key: :stud2, class_name: "Student"}
end
