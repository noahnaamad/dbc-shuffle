class TeachersController < ActionController::Base

  def show
    @teacher = current_teacher
  end

end
