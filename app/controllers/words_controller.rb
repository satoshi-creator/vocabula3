class WordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wordbook

  def index
    @words = @wordbook.words
  end

  def new
    @word = @wordbook.words.build
  end

  def create
    @word = @wordbook.words.build(word_params)
    if @word.save
      redirect_to wordbook_words_path(@wordbook), notice: '単語が追加されました'
    else
      render 'new'
    end
  end

  def edit
    @word = @wordbook.words.find(params[:id])
  end

  def update
    @word = @wordbook.words.find(params[:id])
    if @word.update(word_params)
      redirect_to wordbook_words_path(@wordbook), notice: '単語が更新されました'
    else
      render 'edit'
    end
  end

  def destroy
    @word = @wordbook.words.find(params[:id])
    @word.destroy
    redirect_to wordbook_words_path(@wordbook), notice: '単語が削除されました'
  end

  private

  def set_wordbook
    @wordbook = current_user.wordbooks.find(params[:wordbook_id])
  end

  def word_params
    params.require(:word).permit(:term, :definition)
  end
end
