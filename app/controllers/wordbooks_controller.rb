class WordbooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @wordbooks = current_user.wordbooks
  end

  def show
    @wordbook = current_user.wordbooks.find(params[:id])
  end

  def new
    @wordbook = current_user.wordbooks.build
  end

  def create
    @wordbook = current_user.wordbooks.build(wordbook_params)
    if @wordbook.save
      redirect_to wordbooks_path, notice: '単語帳が作成されました'
    else
      render 'new'
    end
  end

  def edit
    @wordbook = current_user.wordbooks.find(params[:id])
  end

  def update
    @wordbook = current_user.wordbooks.find(params[:id])
    if @wordbook.update(wordbook_params)
      redirect_to wordbooks_path, notice: '単語帳が更新されました'
    else
      render 'edit'
    end
  end

  private

  def wordbook_params
    params.require(:wordbook).permit(:title)
  end
end
