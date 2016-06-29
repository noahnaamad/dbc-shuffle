class StudentController < ApplicationController
  def new
    @student = Student.new(params[:name])
  end

  def create

  end
end
