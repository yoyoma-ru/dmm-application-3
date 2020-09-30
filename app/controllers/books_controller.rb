class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
	end

	def show
		@book = Book.new
		@detail_book = Book.find(params[:id])
	end

	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
		if book.save
			redirect_to book_path(book), notice: "You have created book successfully"
		else
			render :index
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			redirect_to book_path(book), notice: "You have updated book successfully"
		else
			render :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		if book.destroy
			redirect_to books_path
		else
			render :show
		end
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
