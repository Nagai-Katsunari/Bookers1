class BooksController < ApplicationController

  def home
  end

  def list
    @books=Book.all
    @book=Book.new
  end

  
  def index
    @books=Book.all
    @book=Book.new
  end

  def new
    @books=Book.all
    @book=Book.new
  end
  
  def create
    @book = Book.new(books_params)
    @books=Book.all
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      
      render 'new'
      
    end
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id]) #データ(レコード)を1件取得
    book.destroy #データ（レコード）を削除
    redirect_to books_path #List一覧画面へリダイレクト
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end



  private
    def books_params
      params.require(:book).permit(:title, :body)
    end
end
