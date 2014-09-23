class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
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

    if @project.save
      flash[:notice] = 'Success! New project created.'
      redirect_to project_path(@project)
    else
      flash[:error] = 'Please fix errors below.'
      render :new
    end
  end

  def edit
  end

  def update
    @project.update(project_params)

    if @project.save
      flash[:notice] = 'Success! Project updated.'
      redirect_to project_path(@project)
    else
      flash[:notice] = 'Please fix errors below.'
      render :edit
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
