class TasksController < ApplicationController
   def index
    @tasks = Task.all
  end
  def show
    @task = Task.find (params[:id])
  end
  def new             #generate a form
     @task = Task.new

  end
  def edit
    @task = Task.find(params[:id])
#now redirect
  end
  def update
  @task = Task.find(params[:id])

  @task.update(task_params)
  redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private
   def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details)
  end

end
