class TeachersController < ActionController::Base

  def show
    @cohorts_in_location = current_teacher.location.cohorts

  end

end
