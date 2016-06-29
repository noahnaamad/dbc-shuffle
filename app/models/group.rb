class Group < ActiveRecord::Base
  belongs_to :cohort #correct
  has_many :students

  def score(stud_array)
  	score = 0
  	stud_array.each_with_index do |student, index|
  		for i in 1..(arr.length - index)
					compare = arr[index + i]
					current_pair = Pair.find_by(stud1_id: student.id, stud2_id: compare.id)
					current_pair2 = Pair.find_by(stud1_id: compare.id, stud2_id: student.id)
					truthy = current_pair2 || current_pair
					if truthy
						score += truthy.score
					end
				end
  	end
  	score
  end
end
