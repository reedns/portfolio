class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = 'Success! New project created.'
      redirect_to project_path(@project)
    else
      flash[:notice] = 'Please fix errors below.'
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end
end
