class TeachersController < ApplicationController

  def show
    @cohorts_in_location = current_teacher.location.cohorts
  end

<<<<<<< HEAD
=======
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
>>>>>>> b0d8f05751eb2b04815fd6ae3953e11e9758c70c

end
