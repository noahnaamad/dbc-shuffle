class Cohort < ActiveRecord::Base
  has_many :groups
  has_many :students


  def self.pair_students ##ish???
	arr = self.students.to_a
	pairing_score = 0
	pairs = []
	remainder = []
	while !arr.empty? 
		if arr.length == 1
			remainder << arr[0]
		else
			arr.each_with_index do |student, index|
				for i in 1..(arr.length - index)
					compare = arr[index + i]
					current_pair = Pair.find_by(stud1_id: student.id, stud2_id: compare.id)
					current_pair2 = Pair.find_by(stud1_id: compare.id, stud2_id: student.id)
					truthy = current_pair2 || current_pair
					if !truthy
						pairs_arr = []
						pairs_arr << arr.slice!(index + i)
						pairs_arr << arr.slice!(index)
						pairs << pairs_arr
						break
					elsif truthy.score <= pairing_score
						pairs_arr = []
						pairs_arr << arr.slice!(index + i)
						pairs_arr << arr.slice!(index)
						pairs << pairs_arr
						break
					end
				end
			end
		end
		pairing_score += 1
	end
	return [pairs, remainder]
 end

end


