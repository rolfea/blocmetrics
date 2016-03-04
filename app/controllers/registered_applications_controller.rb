class RegisteredApplicationsController < ApplicationController
  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.URL = params[:registered_application][:URL]
    @registered_application.user = current_user

    if @registered_application.save
      flash[:success] = "Application was saved."
      redirect_to @registered_application
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def index
    @registered_applications = RegisteredApplication.all
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.name = params[:registered_application][:name]
    @registered_application.URL = params[:registered_application][:URL]
    @registered_application.user = current_user

    if @registered_application.save
      flash[:success] = "Application was saved."
      redirect_to @registered_application
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "Application has been removed."
      redirect_to registered_applications_path
    else
      flash[:alert] = "Application was not removed. Please try again."
      redirect_to @registered_application
    end
  end
end
