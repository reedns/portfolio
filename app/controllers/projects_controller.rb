class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.js
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.js
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
