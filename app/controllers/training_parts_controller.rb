class TrainingPartsController < ApplicationController
  #include Activity

  # GET /training_parts
  # GET /training_parts.json
  def index
    @training_parts = TrainingPart.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @training_parts }
    end
  end

  # GET /training_parts/1
  # GET /training_parts/1.json
  def show
    @training_part = TrainingPart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @training_part }
    end
  end

  # GET /training_parts/new
  # GET /training_parts/new.json
  def new
    @training_part = TrainingPart.new
    @activities = Activity.all

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @training_part }
      format.json { render :json => {:training_part => @training_part, :activities => @activities} }
    end
  end

  # GET /training_parts/1/edit
  def edit
    @training_part = TrainingPart.find(params[:id])
    @activities = Activity.all
  end

  # POST /training_parts
  # POST /training_parts.json
  def create
    @training_part = TrainingPart.new(params[:training_part])

    respond_to do |format|
      if @training_part.save
        format.html { redirect_to @training_part, notice: 'Training part was successfully created.' }
        format.json { render json: @training_part, status: :created, location: @training_part }
      else
        format.html { render action: "new" }
        format.json { render json: @training_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /training_parts/1
  # PUT /training_parts/1.json
  def update
    @training_part = TrainingPart.find(params[:id])

    respond_to do |format|
      if @training_part.update_attributes(params[:training_part])
        format.html { redirect_to @training_part, notice: 'Training part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @training_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_parts/1
  # DELETE /training_parts/1.json
  def destroy
    @training_part = TrainingPart.find(params[:id])
    @training_part.destroy

    respond_to do |format|
      format.html { redirect_to training_parts_url }
      format.json { head :no_content }
    end
  end
end
