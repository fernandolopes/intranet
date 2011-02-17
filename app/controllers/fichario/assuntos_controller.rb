class Fichario::AssuntosController < TemplateController
  before_filter :authenticate_usuario! 
  # GET /fichario/assuntos
  # GET /fichario/assuntos.xml
  def index
    @fichario_assuntos = Fichario::Assunto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fichario_assuntos }
    end
  end

  # GET /fichario/assuntos/1
  # GET /fichario/assuntos/1.xml
  def show
    @fichario_assunto = Fichario::Assunto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fichario_assunto }
    end
  end

  # GET /fichario/assuntos/new
  # GET /fichario/assuntos/new.xml
  def new
    @fichario_assunto = Fichario::Assunto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fichario_assunto }
    end
  end

  # GET /fichario/assuntos/1/edit
  def edit
    @fichario_assunto = Fichario::Assunto.find(params[:id])
  end

  # POST /fichario/assuntos
  # POST /fichario/assuntos.xml
  def create
    @fichario_assunto = Fichario::Assunto.new(params[:fichario_assunto])

    respond_to do |format|
      if @fichario_assunto.save
        format.html { redirect_to(@fichario_assunto, :notice => 'Assunto was successfully created.') }
        format.xml  { render :xml => @fichario_assunto, :status => :created, :location => @fichario_assunto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fichario_assunto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fichario/assuntos/1
  # PUT /fichario/assuntos/1.xml
  def update
    @fichario_assunto = Fichario::Assunto.find(params[:id])

    respond_to do |format|
      if @fichario_assunto.update_attributes(params[:fichario_assunto])
        format.html { redirect_to(@fichario_assunto, :notice => 'Assunto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fichario_assunto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichario/assuntos/1
  # DELETE /fichario/assuntos/1.xml
  def destroy
    @fichario_assunto = Fichario::Assunto.find(params[:id])
    @fichario_assunto.destroy

    respond_to do |format|
      format.html { redirect_to(fichario_assuntos_url) }
      format.xml  { head :ok }
    end
  end
end
