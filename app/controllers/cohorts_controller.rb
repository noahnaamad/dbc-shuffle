class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def new
    @teachers_drop = Teacher.all.map {|teacher| [teacher.name, teacher.id]}
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def create
    puts "============="
    puts cohort_params
    @cohort = Cohort.new(cohort_params)

    if @cohort.save
      @cohort.teacher = current_teacher
      flash[:notice] = 'Cohort added!'
      redirect_to cohorts_path
    else
      render 'new'
    end
  end
  #create method
    #upon saving adds the teacher associatied with it it would need to have an array

  def update
    @cohort = Cohort.find(params[:id])
    @new_cohort = @cohort.generate_many_groupings(4)
    #group shuffling method goes here
    @cohort = @new_cohort.sorted_groups(params[:size])
  end

  # def update
  #   @article = Article.find(params[:id])

  #   if @article.update(article_params)
  #     redirect_to @article
  #   else
  #     render 'edit'
  #   end
  # end


  def destroy
  end

  private
    def cohort_params
      params.require(:cohort).permit(:name, :location_id)
    end
end

