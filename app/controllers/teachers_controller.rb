class TeachersController < ActionController::Base

  def show
    @teacher = current_teacher
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
