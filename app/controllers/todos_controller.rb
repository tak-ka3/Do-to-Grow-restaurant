class TodosController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      flash[:success] = 'やることが登録されました。'
      redirect_to todos_path
    else
      flash[:danger] = '適切に登録されませんでした。'
      redirect_to new_todo_path
    end
  end

  def index
    @todos = Todo.order("due")
    @todos = @todos.where(user_id: current_user.id)
  end

  def destroy
    todo = Todo.find(todo_params_id[:id])
    current_user.update(points: current_user.points + todo.priority)
    if current_user.save
      if todo.destroy
        flash[:success] = 'また一つレベルアップしました。'
        redirect_to todos_path
      else
        flash[:danger] = 'レベルアップしませんでした。'
        redirect_to todos_path
      end
    else
      flash[:danger] = 'ポイントが適切に更新されませんでした。' 
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:task, :memo,
                                   :priority, :due)
    end

    def todo_params_id
      params.permit(:id)
    end
end
