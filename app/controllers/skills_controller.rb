class SkillsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_action :authorizing_skill, only: [:show, :destroy, :edit, :update]

  def index
    @skills = policy_scope(Skill)
  end

  def show
    @review = Review.new
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
