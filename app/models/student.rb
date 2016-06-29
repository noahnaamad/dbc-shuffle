class Student < ActiveRecord::Base
  has_many :right_hand_pairs, foreign_key: :stud1_id, class_name: :Pair
  has_many :right_hand_students, through: :right_hand_pairs, class_name: :Student, source: :stud2 
  has_many :left_hand_pairs, foreign_key: :stud2_id, class_name: :Pair
  has_many :left_hand_students, through: :left_hand_pairs, class_name: :Student, source: :stud1 
  # has_many :unpaired_with_students, 
  # 	->(paired_with_students) { where.not(paired_with_students) }, class_name: :Student
  belongs_to :group
  has_one :cohort, through: :group
  # has_many :paired_with_students, through: :pairs, source: :stud1, foreign_key: :stud1_id
  has_many :other_paired_with_students, through: :pairs, source: :stud2, foreign_key: :stud2_id

  def paired_with_students
  	right_hand_students + left_hand_students
  end

  def unpaired_with_students
  	cohort.students.where.not(id: paired_with_students.map(&:id) + [id])
  end

end
