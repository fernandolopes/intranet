class Fichario::OrigensController < TemplateController
  before_filter :authenticate_usuario!
  # GET /fichario/origens
  # GET /fichario/origens.xml
  def index
    @fichario_origens = Fichario::Origem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fichario_origens }
    end
  end

  # GET /fichario/origens/1
  # GET /fichario/origens/1.xml
  def show
    @fichario_origem = Origem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fichario_origem }
    end
  end

  # GET /fichario/origens/new
  # GET /fichario/origens/new.xml
  def new
    @fichario_origem = Origem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fichario_origem }
    end
  end

  # GET /fichario/origens/1/edit
  def edit
    @fichario_origem = Origem.find(params[:id])
  end

  # POST /fichario/origens
  # POST /fichario/origens.xml
  def create
    @fichario_origem = Origem.new(params[:fichario_origem])

    respond_to do |format|
      if @fichario_origem.save
        format.html { redirect_to(@fichario_origem, :notice => 'Origem was successfully created.') }
        format.xml  { render :xml => @fichario_origem, :status => :created, :location => @fichario_origem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fichario_origem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fichario/origens/1
  # PUT /fichario/origens/1.xml
  def update
    @fichario_origem = Origem.find(params[:id])

    respond_to do |format|
      if @fichario_origem.update_attributes(params[:fichario_origem])
        format.html { redirect_to(@fichario_origem, :notice => 'Origem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fichario_origem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichario/origens/1
  # DELETE /fichario/origens/1.xml
  def destroy
    @fichario_origem = Origem.find(params[:id])
    @fichario_origem.destroy

    respond_to do |format|
      format.html { redirect_to(fichario_origens_url) }
      format.xml  { head :ok }
    end
  end
end
