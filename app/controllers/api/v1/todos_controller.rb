class Api::V1::TodosController < ApplicationController

	def index
		@todo = Todo.all
		render json: @todo
	end

	def create
		@todo = Todo.new(todo_params)
		@todo.save
		render json: @todo, status: :created
	end

	def update
		@todo = Todo.find(params[:id])

		if @todo.update(todo_params)
			head :no_content
		else
			render json: @todo.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@todo =	Todo.find_by(params[:id])
		@todo.destroy

		head :no_content
	end

	private

	def todo_params
		params.permit(:title, :order, :completed)
	end
end
