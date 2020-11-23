class SkillsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index, :show

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def create
    @skill = Skill.find(params[:id])

  end

  def new
    @skill = Skill.new
  end

  def edit
    @skill = Skill.find(params[:id])

  end

  def update
  end


  def destroy
    @skill = Skill.find(params[:id])

  end
end
