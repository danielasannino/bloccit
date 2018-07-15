class VotesController < ApplicationController
  before_action :require_sign_in

  def up_vote
    update_vote(1)
    redirect_back(fallback_location: :root)
  end

  def down_vote
    update_vote(-1)
    redirect_back(fallback_location: :root)
  end

  private

  def update_vote(new_value)
    @post = Post.find(params[:post_id])
    @vote = @post.votes.find_by(user_id: current_user.id)

    if @vote
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.create(value: new_value, post: @post)
    end
  end
end
