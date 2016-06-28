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
    puts "============="
    puts cohort_params
    @cohort = Cohort.new(cohort_params)

    if @cohort.save
      redirect_to cohorts_path
    else
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

  private
    def cohort_params
      params.require(:cohort).permit(:name, :location, :teacher_id)
    end
end
