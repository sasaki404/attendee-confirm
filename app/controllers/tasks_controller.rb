class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = Task.all.order(id: "DESC")
  end
  
  def create
    @task=current_user.tasks.build(task_params)
    if @task.save
      redirect_to task_path(@task),notice:"参加登録が完了しました！"
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url
  end

  private
  def target_task task_id
    current_user.tasks.where(id: task_id).take
  end

  def task_params
    params.require(:task).permit(:completed,:syozoku)
  end
end
