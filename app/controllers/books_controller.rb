class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @empty_book = Book.new # <==[22. 本の詳細ページで新規投稿フォームが編集フォームになっている] 何も情報が入っていない空のモデルを渡すために追加した。Book.newを記述すると空のモデルが生成され、インスタンス変数@empty_bookに代入されてViewで利用できるようになります。
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      flash[:alert] = '未入力です。メッセージを入力してください。'
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def delete
    @book = Book.find(params[:id])
    @book.destoy
    redirect_to books_path
  end

  private

  def book_params
    # [18. 本の投稿ができない: エラーメッセージが表示されない]を以下の通りに修正した
    # params.require(:book).permit(:title)
    # params.require(:book).permit(:title, :body) <== :bodyを追加した
    params.require(:book).permit(:title, :body)
  end

end
