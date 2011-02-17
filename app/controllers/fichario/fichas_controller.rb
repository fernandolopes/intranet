class Fichario::FichasController < TemplateController
  before_filter :authenticate_usuario!
  # GET /fichario/fichas
  # GET /fichario/fichas.xml
  def index
    @fichario_ficha = Fichario::Ficha.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fichario_fichas }
    end
  end

  # GET /fichario/fichas/1
  # GET /fichario/fichas/1.xml
  def show
    @fichario_ficha = Fichario::Ficha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fichario_ficha }
    end
  end

  # GET /fichario/fichas/new
  # GET /fichario/fichas/new.xml
  def new
    @fichario_ficha = Fichario::Ficha.new
    @assuntos = Fichario::Assunto.all
    @origens  = Fichario::Origem.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fichario_ficha }
    end
  end

  # GET /fichario/fichas/1/edit
  def edit
    @fichario_ficha = Fichario::Ficha.find(params[:id])
    @assuntos = Fichario::Assunto.all
    @origens  = Fichario::Origem.all
  end

  # POST /fichario/fichas
  # POST /fichario/fichas.xml
  def create
    @fichario_ficha = Fichario::Ficha.new(params[:fichario_ficha])

    respond_to do |format|
      if @fichario_ficha.save
        format.html { redirect_to(@fichario_ficha, :notice => 'Ficha was successfully created.') }
        format.xml  { render :xml => @fichario_ficha, :status => :created, :location => @fichario_ficha }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fichario_ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fichario/fichas/1
  # PUT /fichario/fichas/1.xml
  def update
    @fichario_ficha = Fichario::Ficha.find(params[:id])

    respond_to do |format|
      if @fichario_ficha.update_attributes(params[:fichario_ficha])
        format.html { redirect_to(@fichario_ficha, :notice => 'Ficha was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fichario_ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichario/fichas/1
  # DELETE /fichario/fichas/1.xml
  def destroy
    @fichario_ficha = Fichario::Ficha.find(params[:id])
    @fichario_ficha.destroy

    respond_to do |format|
      format.html { redirect_to(fichario_fichas_url) }
      format.xml  { head :ok }
    end
  end
end
