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

    @task.update(task_params)

#now redirect
    direct_to task_path(@task)
  end


  def destroy
  end

  private
   def restaurant_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details)
  end

end
