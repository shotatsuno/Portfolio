class CommentsController < ApplicationController
  def create
    deck = Deck.find(params[:deck_id])
    comment = current_user.comments.new(comment_params)
    comment.deck_id = deck.id
    comment.save
    redirect_to deck_path(deck)
  end
  
  def destroy
    comment = Comment.find(params[:id])
    deck = Deck.find(params[:deck_id])
    comment.destroy
    redirect_to deck_path(deck)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

