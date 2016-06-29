class Cohort < ActiveRecord::Base
  has_many :groups
  has_many :students, through: :groups
  belongs_to :location


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


