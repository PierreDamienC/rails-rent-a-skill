class SkillsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_action :authorizing_skill, only: [:show, :destroy, :edit, :update]

  def index
    if params[:search].present?
      @skills = policy_scope(Skill).search_by_description_and_name_price(params[:search]['skill'])
    else
      @skills = policy_scope(Skill)
    end

    @users = @skills.map { |skill| skill.user }
    @markers = @users.map do |user|
      if user.latitude && user.longitude
        {
          lat: user.latitude,
          lng: user.longitude
        }
      else
        nil
      end
    end
    @markers = @markers.select { |marker| marker != nil }
  end

  def show
    @review = Review.new
    @user = [@skill.user]
    @markers = @user.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def new
    @skill = Skill.new
    authorize @skill
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    authorize @skill

    if @skill.save
      redirect_to skill_path(@skill)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to skill_path(@skill)
    else
      render :new
    end
  end

  def destroy
    @skill.destroy
    redirect_to skills_path
  end

  private

  def authorizing_skill
    authorize @skill
  end

  def skill_params
    params.require(:skill).permit(:name, :description, :price, :photo)
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
