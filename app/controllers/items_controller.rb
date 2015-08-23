class ItemsController < ApplicationController
	before_action :set_todo

	def create
		@item = Item.new(item_params)
		@item.todo_id = @todo.id

		if @item.save
			redirect_to todo_path(@todo), notice: "Added new Todo!"
		else
			redirect_to todo_path(@todo), notice: "Error with todo"
		end
	end

	def destroy
		@item = Item.find(params[:id])

		@item.destroy

		redirect_to todo_path(@todo), notice: "Item was deleted"
	end

	private

	def item_params
		params.require(:item).permit(:content)
	end

	def set_todo
		@todo = Todo.find(params[:todo_id])
	end
end
