class OrigensController < ApplicationController
  # GET /origens
  # GET /origens.xml
  def index
    @origens = Origem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @origens }
    end
  end

  # GET /origens/1
  # GET /origens/1.xml
  def show
    @origem = Origem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @origem }
    end
  end

  # GET /origens/new
  # GET /origens/new.xml
  def new
    @origem = Origem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @origem }
    end
  end

  # GET /origens/1/edit
  def edit
    @origem = Origem.find(params[:id])
  end

  # POST /origens
  # POST /origens.xml
  def create
    @origem = Origem.new(params[:origem])

    respond_to do |format|
      if @origem.save
        format.html { redirect_to(@origem, :notice => 'Origem was successfully created.') }
        format.xml  { render :xml => @origem, :status => :created, :location => @origem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @origem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /origens/1
  # PUT /origens/1.xml
  def update
    @origem = Origem.find(params[:id])

    respond_to do |format|
      if @origem.update_attributes(params[:origem])
        format.html { redirect_to(@origem, :notice => 'Origem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @origem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /origens/1
  # DELETE /origens/1.xml
  def destroy
    @origem = Origem.find(params[:id])
    @origem.destroy

    respond_to do |format|
      format.html { redirect_to(origens_url) }
      format.xml  { head :ok }
    end
  end
end
