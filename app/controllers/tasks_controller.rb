class TasksController < ApplicationController
  # before_action :set_task, only: [:show]

  def index
    @tasks = Task.all
    # raise
  end

  def show
    @task = Task.find(params[:id])
    # raise
  end

  def new
    @task = Task.new # Needed to instantiate the form_for
  end

  def create
    # @task = Task.new(params[:task]) # Will raise ActiveModel::ForbiddenAttributesError
    @task = Task.new(task_params)
    @task.save
    # No need for app/views/tasks/create.html.erb
    redirect_to tasks_path(@task)
  end

  private

  # input of forms is forbidden to save to the DB by default, so we need #task_params
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  # def set_task
  #   @task = Task.find(params[:id])
  # end
end
