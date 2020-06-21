class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
  end

  def new
    @book=Book.new
  end
  
  def create
    book = Book.new(books_params)
    book.save
    redirect_to books_path
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

  private
    def books_params
      params.require(:book).permit(:title, :body)
    end
end
