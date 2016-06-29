module TeachersHelper
  def teachers_for_select
    Teacher.pluck(:name, :id)
  end
end
