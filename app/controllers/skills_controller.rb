class SkillsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
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
    @skill = Skill.find(params[:id])

  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to skill_path(@skill)
    else
      render :new
    end

  end


  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description, :price)
  end
end
