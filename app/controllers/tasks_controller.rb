class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      # displaying the form again
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  # this action DOES NOT have a view
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      # display the form page again
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # status is for turbo
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
