class Admin::TeachersController < ApplicationController
# before_action :configure_sign_up_params, only: [:create]
  def index
    @teachers = Teacher.all
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      flash[:notice] = 'Teacher added!'
      redirect_to '/admin/teachers'
    else
      render 'new'
    end

  end

  def destroy

  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def teacher_params
    params.require(:teacher).permit(:name, :email, :location_id, :password, :password_confirmation)
  end


end