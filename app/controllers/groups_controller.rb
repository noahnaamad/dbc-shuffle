class GroupsController < ApplicationController
  def generate
    @cohort = Cohort.find(params[:cohort_id])
    size = params[:size].to_i
    @groupings = @cohort.generate_one_grouping(size)
    render 'cohorts/show'
  end
end
