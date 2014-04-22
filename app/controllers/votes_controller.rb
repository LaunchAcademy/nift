class VotesController < ApplicationController

  def create
    @vote = Vote.new(value: params[:value], user: current_user, review_id: params[:review_id])

    respond_to do |format|
    if @vote.save
      format.html { redirect_to product_reviews_path(@vote.review.product), notice: 'Your vote has been recorded.'}
      format.js
    else
      format.html { redirect_to product_reviews_path(@vote.review.product), notice: 'My bad! You may have already voted. It not, please sign in.' }
      format.js
  end
end
end

end
