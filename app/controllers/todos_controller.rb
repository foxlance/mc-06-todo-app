class TodosController < ApplicationController
	before_action :set_todo, only: [:show, :edit, :update, :destroy]

	def index
		@todos = Todo.all().order('created_at DESC')
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)

		if @todo.save
			redirect_to @todo, notice: "Todo was created"
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		@todo.update(todo_params)

		if @todo.save
			redirect_to @todo, notice: "Todo was updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@todo.destroy

		redirect_to root_path, notice: "Todo was deleted"
	end



	private	

	def todo_params
		params.require(:todo).permit(:title, :description)
	end

	def set_todo
		@todo = Todo.find(params[:id])
	end

end
