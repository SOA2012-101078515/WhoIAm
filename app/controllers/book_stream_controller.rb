class BookStreamController < ApplicationController

	def index
		@allbooks= Book.all
	end
	def new
	end

	def create
		@newbook = Book.new(params[:newbook])
		@newbook.save
		redirect_to :book_stream => :index
	end
end
