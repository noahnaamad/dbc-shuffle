class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def show

  end

  def new
    # for the dropdown of teachers.. mapping to format select form helper wants, which is [name, value]
    @teachers_drop = Teacher.all.map {|teacher| [teacher.name, teacher.id]}
  end

  def edit

  end

  def create
    # @cohort = Cohort.new()
  end

  def update

  end

  def destroy

  end


end
