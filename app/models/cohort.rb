class Cohort < ActiveRecord::Base
  belongs_to :teacher
  has_many :groups
  has_many :students


  def self.pair_students ##ish???
	arr = Cohort.students
	pairing_score = 0
	pairs = []
	remainder = []
	while !arr.empty? 
		if arr.length == 1
			remainder << arr[0]
		else
			arr.each_with_index do |student, index|
				for i in 1..(arr.length - index)
					if student.(arr[index + i]).pair.score <= pairing_score ##this syntax is wrong
						pairs_arr = []
						pairs_arr << arr.slice!(index)
						pairs_arr << arr.slice!(index + i)
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
