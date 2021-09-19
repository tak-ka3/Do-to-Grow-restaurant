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
    @todos = Todo.all
  end

  def destroy
    todo = Todo.find(todo_params_id[:id])
    if todo.destroy
      flash[:success] = '正しく削除されました。'
      redirect_to todos_path
    else
      flash[:danger] = '削除されませんでした。'
      redirect_to todos_path
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
