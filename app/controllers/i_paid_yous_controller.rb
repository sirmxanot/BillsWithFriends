class IPaidYousController < ApplicationController
  # GET /i_paid_yous
  # GET /i_paid_yous.json
  def index
    @i_paid_yous = IPaidYou.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @i_paid_yous }
    end
  end

  # GET /i_paid_yous/1
  # GET /i_paid_yous/1.json
  def show
    @i_paid_you = IPaidYou.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @i_paid_you }
    end
  end

  # GET /i_paid_yous/new
  # GET /i_paid_yous/new.json
  def new
    @i_paid_you = IPaidYou.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @i_paid_you }
    end
  end

  # GET /i_paid_yous/1/edit
  def edit
    @i_paid_you = IPaidYou.find(params[:id])
  end

  # POST /i_paid_yous
  # POST /i_paid_yous.json
  def create
    @i_paid_you = IPaidYou.new(params[:i_paid_you])

    respond_to do |format|
      if @i_paid_you.save
        format.html { redirect_to @i_paid_you, notice: 'I paid you was successfully created.' }
        format.json { render json: @i_paid_you, status: :created, location: @i_paid_you }
      else
        format.html { render action: "new" }
        format.json { render json: @i_paid_you.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /i_paid_yous/1
  # PUT /i_paid_yous/1.json
  def update
    @i_paid_you = IPaidYou.find(params[:id])

    respond_to do |format|
      if @i_paid_you.update_attributes(params[:i_paid_you])
        format.html { redirect_to @i_paid_you, notice: 'I paid you was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @i_paid_you.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /i_paid_yous/1
  # DELETE /i_paid_yous/1.json
  def destroy
    @i_paid_you = IPaidYou.find(params[:id])
    @i_paid_you.destroy

    respond_to do |format|
      format.html { redirect_to i_paid_yous_url }
      format.json { head :ok }
    end
  end
end
