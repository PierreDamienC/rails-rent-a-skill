class SkillsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skills = Skill.all
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user

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

  def skill_params
    params.require(:skill).permit(:name, :description, :price, :photo)
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
