class TeachersController < ApplicationController

  def show
    @cohorts_in_location = current_teacher.location.cohorts
  end

  def create
    puts "============="
    puts teacher_params
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      flash[:notice] = 'Teacher added!'
      redirect_to teachers_path
    else
      render 'new'
    end

  end

end
