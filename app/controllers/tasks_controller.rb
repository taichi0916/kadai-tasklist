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
      flash[:success] = "新規タスクを投稿ました。"
      redirect_to @task
    else
      flash.now[:danger] = "新規タスクの投稿が失敗しました。"
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
  end
  
  def destroy
    @task = Task.find(params[:id])
  end
  
  private
  
  def task_params
    params.rquire(:task).permit(:content)
  end
end
