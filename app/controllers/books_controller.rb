class BooksController < ApplicationController
  def index
    @book = Book.all
    book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
  end

  def destory
  end

  private

  def post_image_params
    params.require(:book).permit(:title, :body)
  end

end
