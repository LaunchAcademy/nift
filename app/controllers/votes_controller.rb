class VotesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    if current_user != nil
      @vote = Vote.find_or_initialize_by(user: current_user, review_id: params[:review_id])
      @vote.value = params[:value]
      if @vote.save
        redirect_to product_path(@review.product), notice: 'Your vote has been recorded.'
      else
        redirect_to product_path(@review.product), notice: 'There was an error with your vote.'
      end
    else
      redirect_to product_path(@review.product), notice: "Please sign in to vote!"
    end
  end
end
