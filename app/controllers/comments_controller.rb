class CommentsController < ApplicationController
  
  def new
    @deck=Deck.find(params[:deck_id])
    @comment = Comment.new
  end
  
  def create
    deck = Deck.find(params[:deck_id])
    comment = current_user.comments.new(comment_params)
    comment.deck_id = deck.id
    if comment.save
      redirect_to deck_path(deck)
    else
      redirect_to new_deck_comment_path(deck),notice: "コメントは1文字以上300字以内でお願いします。"
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    deck = Deck.find(params[:deck_id])
    comment.destroy
    if comment.user.id == current_user.id
    redirect_to deck_path(deck)
    else
    redirect_to edit_deck_path(deck)
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

