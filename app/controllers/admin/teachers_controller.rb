class Admin::TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def create

  end

  def destroy

  end

end