class CoordinatesController < ApplicationController
  # GET /coordinates
  # GET /coordinates.json
  def index
    @coordinates = Coordinate.scoped

    if params[:re_type] && params[:re_type] != "0"
      @coordinates = @coordinates.where(:re_type => params[:re_type])
    end

    if params[:term] && params[:term] != "0"
      @coordinates = @coordinates.where(:term => params[:term])
    end



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coordinates }
    end
  end

  # GET /coordinates/1
  # GET /coordinates/1.json
  def show
    @coordinate = Coordinate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coordinate }
    end
  end

  # GET /coordinates/new
  # GET /coordinates/new.json
  def new
    @coordinate = Coordinate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coordinate }
    end
  end

  # GET /coordinates/1/edit
  def edit
    @coordinate = Coordinate.find(params[:id])
  end

  # POST /coordinates
  # POST /coordinates.json
  def create
    @coordinate = Coordinate.new(params[:coordinate])

    respond_to do |format|
      if @coordinate.save
        format.html { redirect_to @coordinate, notice: 'Coordinate was successfully created.' }
        format.json { render json: @coordinate, status: :created, location: @coordinate }
      else
        format.html { render action: "new" }
        format.json { render json: @coordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coordinates/1
  # PUT /coordinates/1.json
  def update
    @coordinate = Coordinate.find(params[:id])

    respond_to do |format|
      if @coordinate.update_attributes(params[:coordinate])
        format.html { redirect_to @coordinate, notice: 'Coordinate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coordinates/1
  # DELETE /coordinates/1.json
  def destroy
    @coordinate = Coordinate.find(params[:id])
    @coordinate.destroy

    respond_to do |format|
      format.html { redirect_to coordinates_url }
      format.json { head :no_content }
    end
  end


  def generate

    lat =  34.0522
    lng = -118.2428


    5.times do

        lat = lat + (rand()/5 * [1,-1].sample)
        lng = lng + (rand()/5 * [1,-1].sample)
        newName = Coordinate.all.count + 1
        retype = [1,2,3,4].sample
        term = [1,2].sample
        sqft = rand(150000)


      Coordinate.create(latitude: lat, longitude: lng, name: "Property " + newName.to_s, re_type: retype, term: term, sq_foot: sqft)

    end

   redirect_to coordinates_url
  end


end
