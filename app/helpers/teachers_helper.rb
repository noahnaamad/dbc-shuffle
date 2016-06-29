module TeachersHelper

  def resource_name
    :teacher
  end

  def resource
    @resource ||= Teacher.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:teacher]
  end

  def teachers_for_select
    Teacher.pluck(:name, :id)
  end

end

