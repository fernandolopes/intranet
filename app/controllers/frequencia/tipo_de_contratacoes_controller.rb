class Frequencia::TipoDeContratacoesController < TemplateController
  before_filter :authenticate_user!
  # GET /frequencia/tipo_de_contratacoes
  # GET /frequencia/tipo_de_contratacoes.xml
  def index
    @frequencia_tipo_de_contratacoes = Frequencia::TipoDeContratacao.order('updated_at ASC').paginate :page => params[:page], :per_page => 10
    @total = Frequencia::TipoDeContratacao.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frequencia_tipo_de_contratacoes }
    end
  end

  # GET /frequencia/tipo_de_contratacoes/1
  # GET /frequencia/tipo_de_contratacoes/1.xml
  def show
    @frequencia_tipo_de_contratacao = Frequencia::TipoDeContratacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frequencia_tipo_de_contratacao }
    end
  end

  # GET /frequencia/tipo_de_contratacoes/new
  # GET /frequencia/tipo_de_contratacoes/new.xml
  def new
    @frequencia_tipo_de_contratacao = Frequencia::TipoDeContratacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequencia_tipo_de_contratacao }
    end
  end

  # GET /frequencia/tipo_de_contratacoes/1/edit
  def edit
    @frequencia_tipo_de_contratacao = Frequencia::TipoDeContratacao.find(params[:id])
  end

  # POST /frequencia/tipo_de_contratacoes
  # POST /frequencia/tipo_de_contratacoes.xml
  def create
    @frequencia_tipo_de_contratacao = Frequencia::TipoDeContratacao.new(params[:frequencia_tipo_de_contratacao])

    respond_to do |format|
      if @frequencia_tipo_de_contratacao.save
        format.html { redirect_to(@frequencia_tipo_de_contratacao, :notice => 'Tipo de contratacao was successfully created.') }
        format.xml  { render :xml => @frequencia_tipo_de_contratacao, :status => :created, :location => @frequencia_tipo_de_contratacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frequencia_tipo_de_contratacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /frequencia/tipo_de_contratacoes/1
  # PUT /frequencia/tipo_de_contratacoes/1.xml
  def update
    @frequencia_tipo_de_contratacao = Frequencia::TipoDeContratacao.find(params[:id])

    respond_to do |format|
      if @frequencia_tipo_de_contratacao.update_attributes(params[:frequencia_tipo_de_contratacao])
        format.html { redirect_to(@frequencia_tipo_de_contratacao, :notice => 'Tipo de contratacao was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frequencia_tipo_de_contratacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /frequencia/tipo_de_contratacoes/1
  # DELETE /frequencia/tipo_de_contratacoes/1.xml
  def destroy
    @frequencia_tipo_de_contratacao = Frequencia::TipoDeContratacao.find(params[:id])
    @frequencia_tipo_de_contratacao.destroy

    respond_to do |format|
      format.html { redirect_to(frequencia_tipo_de_contratacoes_url) }
      format.xml  { head :ok }
    end
  end
end
