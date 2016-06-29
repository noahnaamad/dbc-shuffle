class Cohort < ActiveRecord::Base
  has_many :groups
  has_many :students, through: :groups
  belongs_to :location


  def pair_students ##not class method because running on one instance of cohort
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

 def determine_group_sizes(size) #given ideal group size
 	group_sizes = []
 	students_array = self.students.to_a
 	num_students = students_array.length
 	remainder = num_students % size
 	num_groups = num_students/size ##number of groups, aside from the remainder group (if it exists)
 	if remainder + 1 == size
 		group_sizes << remainder
 		while (group_sizes.length < (num_groups + 1))
 			group_sizes << size
 		end
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

 def generate_one_grouping(size, paired_students)
 	group_sizes_array = determine_group_sizes(size)
 	groups = []
 	pairs = paired_students[0]
 	pairs.shuffle!
 	remainders = paired_students[1]
 	group_sizes_array.each do |size|
 		group = []
 		if size % 2 == 0
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
 	groups.map do |group|
 		group.flatten!
 	end
 	groups
 end

 def generate_many_groupings(size, paired_students)
 	cohort_groupings = []
 	100.times do 
 		cohort_groupings << generate_one_grouping(size, paired_students)
 	end
 	cohort_groupings
 end

 def sorted_groups(size, paired_students)
 	cohort_groupings = generate_many_groupings(size, paired_students)
 	cohort_id = self.id
 	cohort_groupings.map do |cohort|
 		cohort_score = 0
 		group_id = 1
 		cohort.each do |group|
 			group.each do |student|
 				student.group = group_id
 				#well fuck.
 			end
 			cohort_score += this_group.score
 		end
 	end
 	##give each group in that cohort a group id, assign its students to it, figure out total cohort score
 	##save each cohort grouping in a hash with its score, sort hash
 end



end


