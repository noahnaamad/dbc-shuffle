class Pair < ActiveRecord::Base
  belongs_to :stud1, {foreign_key: :stud1_id, class_name: "Student"}
  belongs_to :stud2, {foreign_key: :stud2_id, class_name: "Student"}
end
