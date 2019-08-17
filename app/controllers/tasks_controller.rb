class TasksController < ApplicationController
  def index
    @tasks = Tasks.all
  end

  def show
    @tasks = Tasks.find(params[:id]) 
  end

  def new
    @tasks = Tasks.new  
  end

  def create
    @message = Message.new(message_params)

    if @tasks.save
      flash[:success] = 'Tasks が正常に投稿されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Tasks が投稿されませんでした'
      render :new
    end  
  end

  def edit
    @tasks = Tasks.find(params[:id])  
  end

  def update
    @tasks = Tasks.find(params[:id])

    if @tasks.update(tasks_params)
      flash[:success] = 'Tasks は正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Tasks は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasks = Tasks.find(params[:id])
    @tasks.destroy

    flash[:success] = 'Tasks は正常に削除されました'
    redirect_to tasks_url 
  end
  
  private
  
  def tasks_params
    params.require(:tasks).permit(:content)
  end
end
