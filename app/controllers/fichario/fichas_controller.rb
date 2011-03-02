class Fichario::FichasController < TemplateController
  before_filter :authenticate_usuario!
  before_filter :load_assuntos, :only => [:new, :edit, :create, :update]
  before_filter :load_origens, :only => [:new, :edit, :create, :update]
  
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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fichario_ficha }
    end
  end

  # GET /fichario/fichas/1/edit
  def edit
    @fichario_ficha = Fichario::Ficha.find(params[:id])
  end

  # POST /fichario/fichas
  # POST /fichario/fichas.xml
  def create
    params[:fichario_ficha][:fone].gsub!(/\-|\.|\/|\(|\)| /,"")
    params[:fichario_ficha][:celular].gsub!(/\-|\.|\/|\(|\)| /,"")
    params[:fichario_ficha][:cpf].gsub!(/\-|\.|\/|\(|\)| /,"")
    @fichario_ficha = Fichario::Ficha.new(params[:fichario_ficha])


    respond_to do |format|
      if @fichario_ficha.save
        format.html { redirect_to(@fichario_ficha, :notice => 'Ficha foi criada com sucesso.') }
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
    params[:fichario_ficha][:fone].gsub!(/\-|\.|\/|\(|\)| /,"")
    params[:fichario_ficha][:celular].gsub!(/\-|\.|\/|\(|\)| /,"")
    params[:fichario_ficha][:cpf].gsub!(/\-|\.|\/|\(|\)| /,"")
    @fichario_ficha = Fichario::Ficha.find(params[:id])
    @fichario_ficha.pja = data_americana(params[:fichario_ficha][:pja])
    @fichario_ficha.entrada = data_americana(params[:fichario_ficha][:entrada])

    raise @fichario_ficha.inspect

    respond_to do |format|
      if @fichario_ficha.update_attributes(params[:fichario_ficha])
        format.html { redirect_to(@fichario_ficha, :notice => 'Ficha foi atualizada com sucesso.') }
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
  
  private
  def load_assuntos
    @assuntos = Fichario::Assunto.all.collect { |a| [a.descricao, a.id] }
  end
  
  def load_origens
    @origens  = Fichario::Origem.all.collect { |a| [a.descricao, a.id] }
  end
end
