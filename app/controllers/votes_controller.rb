class VotesController < ApplicationController

  def create
    @vote = Vote.new(value: params[:value], user: current_user, review_id: params[:review_id])
    if @vote.save
      redirect_to product_path(@vote.review.product), notice: 'Your vote has been recorded.'
    else
      redirect_to product_path(@vote.review.product), notice: 'My bad! You may have already voted. It not, please sign in.'
    end
  end
end
