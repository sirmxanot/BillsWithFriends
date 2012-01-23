class YouOweMesController < ApplicationController
  # GET /you_owe_mes
  # GET /you_owe_mes.json
  def index
    @you_owe_mes = YouOweMe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @you_owe_mes }
    end
  end

  # GET /you_owe_mes/1
  # GET /you_owe_mes/1.json
  def show
    @you_owe_me = YouOweMe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @you_owe_me }
    end
  end

  # GET /you_owe_mes/new
  # GET /you_owe_mes/new.json
  def new
    @you_owe_me = YouOweMe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @you_owe_me }
    end
  end

  # GET /you_owe_mes/1/edit
  def edit
    @you_owe_me = YouOweMe.find(params[:id])
  end

  # POST /you_owe_mes
  # POST /you_owe_mes.json
  def create
    @you_owe_me = YouOweMe.new(params[:you_owe_me])

    respond_to do |format|
      if @you_owe_me.save
        format.html { redirect_to @you_owe_me, notice: 'You owe me was successfully created.' }
        format.json { render json: @you_owe_me, status: :created, location: @you_owe_me }
      else
        format.html { render action: "new" }
        format.json { render json: @you_owe_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /you_owe_mes/1
  # PUT /you_owe_mes/1.json
  def update
    @you_owe_me = YouOweMe.find(params[:id])

    respond_to do |format|
      if @you_owe_me.update_attributes(params[:you_owe_me])
        format.html { redirect_to @you_owe_me, notice: 'You owe me was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @you_owe_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /you_owe_mes/1
  # DELETE /you_owe_mes/1.json
  def destroy
    @you_owe_me = YouOweMe.find(params[:id])
    @you_owe_me.destroy

    respond_to do |format|
      format.html { redirect_to you_owe_mes_url }
      format.json { head :ok }
    end
  end
end
