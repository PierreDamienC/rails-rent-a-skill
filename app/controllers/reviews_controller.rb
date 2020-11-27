class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @user = current_user
    @skill = Skill.find(params[:skill_id])
    @review.user = @user
    @review.skill = @skill

    authorize @review

    if @review.save
      redirect_to skill_path(@skill, anchor: "anchor-reviews")
    else
      render "skills/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
