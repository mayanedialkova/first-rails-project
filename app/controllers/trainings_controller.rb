class TrainingsController < ApplicationController
  # GET /month
  # GET /month.json
  def month
    @trainings = Training.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trainings }
    end
  end

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Training.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trainings }
    end
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
    @training = Training.find(params[:id])
    @activities = Activity.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json => { :training => @training, :activities => @activities} }
    end
  end

  # GET /trainings/new
  # GET /trainings/new.json
  def new
    @training = Training.new
    @training.training_parts.build #
    @activities = Activity.all

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json => { :training => @training, :training_parts => @training.training_parts, :activities => @activities} }
      format.json { render json => { :training => @training, :activities => @activities} } #
    end
  end

  # GET /trainings/1/edit
  def edit
    @training = Training.find(params[:id])
    @activities = Activity.all
    
    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json => { :training => @training, :training_parts => @training.training_parts, :activities => @activities} }
      format.json { render json => { :training => @training, :activities => @activities} } #
    end
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = Training.new(params[:training])
    
    if params[:add_training_part]
      @training.training_parts.build
    #elsif params[:remove_training_part]
      # nested model that have _destroy attribute = 1 automatically deleted by rails
    else
      if @training.save
        flash[:notice] = "Successfully created training."
        redirect_to @training and return
      end
    end
    render :action => 'new'

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'Training was successfully created.' }
        format.json { render json: @training, status: :created, location: @training }
      else
        format.html { render action: "new" }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trainings/1
  # PUT /trainings/1.json
  def update
    @training = Training.find(params[:id])

    respond_to do |format|
      if @training.update_attributes(params[:training])
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training = Training.find(params[:id])
    @training.destroy

    respond_to do |format|
      format.html { redirect_to trainings_url }
      format.json { head :no_content }
    end
  end
end
