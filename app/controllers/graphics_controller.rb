class GraphicsController < ApplicationController
  # GET /months
  # GET /months.json
  def months
    @trainings = Training.all
    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trainings }
    end
  end
  
  # GET /days
  # GET /days.json
  def days
    @trainings = Training.all
    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trainings }
    end
  end
end
