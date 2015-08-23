class ItemsController < ApplicationController
	before_action :set_todo
	before_action :set_item, except: [:create]

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
		@item.destroy

		redirect_to todo_path(@todo), notice: "Item was deleted"
	end

	def mark_as_complete
		@item.update_attribute(:completed_at, Time.now)
		@item.save

		redirect_to todo_path(@todo), notice: "Item was marked as completed"
	end

	private

	def set_item
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:content)
	end

	def set_todo
		@todo = Todo.find(params[:todo_id])
	end
end
