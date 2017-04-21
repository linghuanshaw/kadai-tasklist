class TasksController < ApplicationController
   
  before_action :require_user_logged_in
  before_action :current_user
   
   def index
      @tasks=Task.order(created_at: :desc).page(params[:page]).per(10)
   end
   
   def show
      @task=Task.find(params[:id])
   end
   
   def create
      @task=current_user.tasks.build(task_params)
      
      if @task.save
         flash[:success]="Taskが正常に登録されました"
         redirect_to root_path
      else
         @task=current_user.tasks.order('created_at DESC').page(params[:page])
         flash.now[:danger]="Taskが登録されませんでした"
         render 'toppages/index'
      end
         
   end
   
   def new
      @task=Task.new
   end
   
   def update
      @task=Task.find(params[:id])
      
      if @task.update(task_params)
         flash[:success] = "タスクが正常に修正されました"
         redirect_to @task
      else
         flash.now[:danger]="タスクが修正されませんでした"
         render :edit
      end
   end
   
   def edit
      @task=Task.find(params[:id])
   end
   
   def destroy
      @task=Task.find(params[:id])
      @task.destroy
      flash[:success]="Taskが正常に削除されました"
      redirect_to root_path
      
   #  redirect_back(fallback_location: root_path)
   end
   
   private
   
   def task_params
      params.require(:task).permit(:content,:title,:status)
   end
   
   def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_path
    end
   end
   
end