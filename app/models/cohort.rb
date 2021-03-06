class Cohort < ActiveRecord::Base
  has_many :groups
  has_many :students, through: :groups
  belongs_to :location

	def determine_group_sizes(size) #given ideal group size YAY THIS WORKS
	 	group_sizes = []
	 	students_array = self.students.to_a
	 	num_students = students_array.length
	 	remainder = num_students % size
	 	num_groups = num_students/size ##number of groups, aside from the remainder group (if it exists)
	 	if remainder + 1 == size
	 		while (group_sizes.length < (num_groups))
	 			group_sizes << size
	 		end
	 		group_sizes << remainder
	 	else
	 		while remainder > 0
	 			group_sizes << (size + 1)
	 			remainder -= 1
	 		end
	 		while group_sizes.length < num_groups
	 			group_sizes << size
	 		end
	 	end
	 	group_sizes
	 end

  def pair_students ##not class method because running on one instance of cohort
	arr = self.students.to_a
	pairing_score = 1
	pairs = []
	remainder = []
	while !arr.empty?
		if arr.length == 1
			remainder << arr[0]
		else
			arr.each_with_index do |student, index|
				for i in 1..(arr.length - index - 1)
					compare = arr[index + i]
					current_pair = Pair.find_by(stud1_id: student.id, stud2_id: compare.id)
					current_pair2 = Pair.find_by(stud1_id: compare.id, stud2_id: student.id)
					truthy = current_pair2 || current_pair
					if !truthy
						pairs_arr = []
						pairs_arr << arr.slice!(index + i)
						pairs_arr << arr.slice!(index)
						pairs << pairs_arr
						next
					elsif truthy.score <= pairing_score
						pairs_arr = []
						pairs_arr << arr.slice!(index + i)
						pairs_arr << arr.slice!(index)
						pairs << pairs_arr
						next
					end
				end
			end
		end
		pairing_score += 1
	end
	return [pairs, remainder]
 end


 def generate_one_grouping(size)
 	group_sizes_array = determine_group_sizes(size)
 	groups = []
 	pairs = pair_students[0]
 	pairs.shuffle!
 	remainders = pair_students[1]
 	group_sizes_array.each do |size|
 		group = []
 		if size.even?
 			while group.length < size/2
 				group << pairs.slice!(0)
 			end
 			groups << group
 		else ##group size odd, have to make sure there's a remainder
 			if remainders.empty?
 				remainders << pairs.pop
 				remainders.flatten!
 			end
 			group << remainders.slice!(0)
 			while group.length < ((size+1)/2)
 				group << pairs.slice!(0)
 			end
 			groups << group
 		end
 	end
 	groups.each do |group|
 		group.flatten!
 	end

 	groups
 end


def generate_one_grouping(size)
	students_array = self.students.to_a
	students_array.shuffle!
 	group_sizes_array = determine_group_sizes(size)
 	groups = []
 	group_sizes_array.each do |size|
 		group = []
		while group.length < size
			group << students_array.slice!(0)
		end
			groups << group
 	end
 	groups
 end

 def generate_many_groupings(size)
 	cohort_groupings = []
 	100.times do
 		cohort_groupings << generate_one_grouping(size, pair_students)
 	end
 	cohort_groupings
 end

 def groups_with_score(size)
 	cohort_groupings = generate_many_groupings(size)
 	# cohort_id = self.id
 	scores_with_cohorts = {}
 	cohort_groupings.each do |cohort|
 		# figure out total score of all groups in cohort
 		cohort_score = 0
 		cohort.each do |group|
 			cohort_score += score(group)
 		end
 		##save each cohort grouping in a hash with its score
 		if scores_of_cohorts[cohort_score]
 			scores_of_cohorts[cohort_score] << cohort_score
 		else
			scores_of_cohorts[cohort_score] = [cohort]
 		end
 	end
 	# cohort_groupings.sort!{|cohort, score| score}
 	scores_of_cohorts
 end

 def best_cohorts(size)
 		groupings = groups_with_score(size)
 		score = 0
 		loop do
 			if groupings[score]
 				return groupings[score]
 			else
 				score += 1
 			end
 		end
 end

##----------------  second approach!! ----------------##
	def group_by_week(size, week)
		arr = self.students.to_a
		primes = [2, 3, 5, 7, 11, 13, 17] #prime numbers
		skip_by = primes[week - 1]
		group_sizes = determine_group_sizes(size)
		cohort = []
		index = 0
		group_sizes.each do |group|
			group_members = []
			while group > 0

			end
		end
	end

end

###########################################################################################
###not the function i wanna use
###prefer a different return value
 # def groups_with_score(size)
 # 	cohort_groupings = generate_many_groupings(size)
 # 	# cohort_id = self.id
 # 	cohort_groupings.map do |cohort|
 # 		# figure out total cohort score
 # 		cohort_score = 0
 # 		cohort.each do |group|
 # 			cohort_score += score(group)
 # 		end
 # 		##save each cohort grouping in a hash with its score
 # 		{cohort => cohort_score}
 # 	end
 # 	# cohort_groupings.sort!{|cohort, score| score}
 # 	cohort_groupings
 # end

 # def pair_students  ##outputs the right thing but not helpful
 # 	arr = self.students.to_a
 # 	arr.shuffle!
 # 	pairs = []
 # 	remainder = []
 # 	while !arr.empty?
 # 		if arr.length == 1
 # 			remainder << arr[0]
 # 		else
 # 			pair = []
 # 			pair << arr.slice!(0)
 # 			pair << arr.slice!(0)
 # 			pairs << pair
 # 		end
 # 	end
 # 	return [pairs, remainder]
 # end

