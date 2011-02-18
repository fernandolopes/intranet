class Fichario::AndamentosController < TemplateController
  # GET /fichario/andamentos
  # GET /fichario/andamentos.xml
  def index
    @fichario_andamentos = Fichario::Andamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fichario_andamentos }
    end
  end

  # GET /fichario/andamentos/1
  # GET /fichario/andamentos/1.xml
  def show
    @fichario_andamento = Fichario::Andamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fichario_andamento }
    end
  end

  # GET /fichario/andamentos/new
  # GET /fichario/andamentos/new.xml
  def new
    @fichario_andamento = Fichario::Andamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fichario_andamento }
    end
  end

  # GET /fichario/andamentos/1/edit
  def edit
    @fichario_andamento = Fichario::Andamento.find(params[:id])
  end

  # POST /fichario/andamentos
  # POST /fichario/andamentos.xml
  def create
    @fichario_andamento = Fichario::Andamento.new(params[:fichario_andamento])

    respond_to do |format|
      if @fichario_andamento.save
        format.html { redirect_to(@fichario_andamento, :notice => 'Andamento foi criado com sucesso.') }
        format.xml  { render :xml => @fichario_andamento, :status => :created, :location => @fichario_andamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fichario_andamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fichario/andamentos/1
  # PUT /fichario/andamentos/1.xml
  def update
    @fichario_andamento = Fichario::Andamento.find(params[:id])

    respond_to do |format|
      if @fichario_andamento.update_attributes(params[:fichario_andamento])
        format.html { redirect_to(@fichario_andamento, :notice => 'Andamento foi atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fichario_andamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichario/andamentos/1
  # DELETE /fichario/andamentos/1.xml
  def destroy
    @fichario_andamento = Fichario::Andamento.find(params[:id])
    @fichario_andamento.destroy

    respond_to do |format|
      format.html { redirect_to(fichario_andamentos_url) }
      format.xml  { head :ok }
    end
  end
end
