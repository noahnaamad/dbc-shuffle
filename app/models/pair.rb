class Pair < ActiveRecord::Base
  belongs_to :stud1, {foreign_key: :stud1_id, class_name: "Student"}
  belongs_to :stud2, {foreign_key: :stud2_id, class_name: "Student"}

  validates :stud1, uniqueness: { scope: :stud2 }
  validate :students_are_not_the_same

  def self.create(stud1, stud2)
    raise ArgumentError, "The same student cannot be paired with themself" if stud1 == stud2
    super(stud1_id: [stud1, stud2].min, stud2_id: [stud1, stud2].max)
  end

  private
  def students_are_not_the_same
    errors.add(:stud1, "cannot be the same as stud2") if stud1 == stud2
  end

end