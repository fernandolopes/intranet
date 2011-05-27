class Fichario::AndamentoFichasController < TemplateController
  before_filter :authenticate_user!
  # GET /fichario/andamento_fichas
  # GET /fichario/andamento_fichas.xml
  def index
		authorize! :index, @user

    @fichario_andamento_fichas = Fichario::AndamentoFicha.order('created_at DESC').paginate :page => params[:page], :per_page => 5
    @total = Fichario::AndamentoFicha.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fichario_andamento_fichas }
    end
  end

  # GET /fichario/andamento_fichas/1
  # GET /fichario/andamento_fichas/1.xml
  def show
		authorize! :index, @user

    @fichario_andamento_ficha = Fichario::AndamentoFicha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb.erb
      format.xml  { render :xml => @fichario_andamento_ficha }
    end
  end

  # GET /fichario/andamento_fichas/new
  # GET /fichario/andamento_fichas/new.xml
  def new
		authorize! :index, @user

    @fichario_andamento_ficha = Fichario::AndamentoFicha.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fichario_andamento_ficha }
    end
  end

  # GET /fichario/andamento_fichas/1/edit
  def edit
		authorize! :index, @user

    @fichario_andamento_ficha = Fichario::AndamentoFicha.find(params[:id])
  end

  # POST /fichario/andamento_fichas
  # POST /fichario/andamento_fichas.xml
  def create
		authorize! :index, @user

    params[:fichario_andamento_ficha][:data] = params[:fichario_andamento_ficha][:data].to_date
    @fichario_andamento_ficha = Fichario::AndamentoFicha.new(params[:fichario_andamento_ficha])

    respond_to do |format|
      if @fichario_andamento_ficha.save
        format.html { redirect_to(@fichario_andamento_ficha, :notice => 'Andamento criado com sucesso.') }
        format.xml  { render :xml => @fichario_andamento_ficha, :status => :created, :location => @fichario_andamento_ficha }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fichario_andamento_ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fichario/andamento_fichas/1
  # PUT /fichario/andamento_fichas/1.xml
  def update
		authorize! :index, @user

    params[:fichario_andamento_ficha][:data] = params[:fichario_andamento_ficha][:data].to_date
    @fichario_andamento_ficha = Fichario::AndamentoFicha.find(params[:id])

    respond_to do |format|
      if @fichario_andamento_ficha.update_attributes(params[:fichario_andamento_ficha])
        format.html { redirect_to(@fichario_andamento_ficha, :notice => 'Andamento atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fichario_andamento_ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichario/andamento_fichas/1
  # DELETE /fichario/andamento_fichas/1.xml
  def destroy
		authorize! :index, @user

    @fichario_andamento_ficha = Fichario::AndamentoFicha.find(params[:id])
    @fichario_andamento_ficha.destroy

    respond_to do |format|
      format.html { redirect_to(fichario_andamento_fichas_url) }
      format.xml  { head :ok }
    end
  end
end
