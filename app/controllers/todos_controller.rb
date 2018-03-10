class TodosController < ApplicationController
  
  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.new(todo_params)
    if @todo.save
      redirect_to root_path
    else
      flash[:error] = "Unable to create new todo"
      render :new
    end
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  def edit
    @todo = current_user.todos.find(params[:id])
  end

  def update
    @todo = current_user.todos.find(params[:id])
    if @todo.update_attributes(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  def toggle_state
    todo = current_user.todos.find(params[:id])
    @item = todo.items.find(params[:item_id])
    @item.state = @item.state == "done" ? 1 : 0
    @item.save
    redirect_to todo_path(todo)
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description, items_attributes: [:id, :title, :_destroy])
  end

end
