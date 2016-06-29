class Pair < ActiveRecord::Base
  belongs_to :stud1, {foreign_key: :stud1_id, class_name: "Student"}
  belongs_to :stud2, {foreign_key: :stud2_id, class_name: "Student"}

  def create(stud1, stud2)
  	if stud2 < stud1
  		super(stud1_id: stud2, stud2_id: stud1)
  	else
  		super(stud1_id: stud1, stud2_id: stud2)
  	end
  end

end