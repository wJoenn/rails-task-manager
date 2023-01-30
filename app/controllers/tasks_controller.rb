class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update completed]
  def index
    @tasks = Task.all
  end

  def show() end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    redirect_to task_path(task)
  end

  def edit() end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    Task.destroy(params['id'])
    redirect_to tasks_path, status: :see_other
  end

  def completed
    @task.update(completed: !@task.completed)
    redirect_back_or_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params['id'])
  end
end
