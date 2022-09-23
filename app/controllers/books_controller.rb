class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end



  def show
  end


  def edit
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated'
    redirect_to book_path(@book.id)
     else
      render :edit
    end
 end  




   private

  def book_params
    params.require(:book).permit(:name)
  end
end
