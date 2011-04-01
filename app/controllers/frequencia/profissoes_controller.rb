class Frequencia::ProfissoesController < TemplateController
  before_filter :authenticate_usuario!
  # GET /frequencia/profissoes
  # GET /frequencia/profissoes.xml
  def index
    @frequencia_profissoes = Frequencia::Profissao.order('updated_at ASC').paginate :page => params[:page], :per_page => 10
    @total = Frequencia::Profissao.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frequencia_profissoes }
    end
  end

  # GET /frequencia/profissoes/1
  # GET /frequencia/profissoes/1.xml
  def show
    @frequencia_profissao = Frequencia::Profissao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frequencia_profissao }
    end
  end

  # GET /frequencia/profissoes/new
  # GET /frequencia/profissoes/new.xml
  def new
    @frequencia_profissao = Frequencia::Profissao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequencia_profissao }
    end
  end

  # GET /frequencia/profissoes/1/edit
  def edit
    @frequencia_profissao = Frequencia::Profissao.find(params[:id])
  end

  # POST /frequencia/profissoes
  # POST /frequencia/profissoes.xml
  def create
    @frequencia_profissao = Frequencia::Profissao.new(params[:frequencia_profissao])

    respond_to do |format|
      if @frequencia_profissao.save
        format.html { redirect_to(@frequencia_profissao, :notice => 'Profissão salva com sucesso.') }
        format.xml  { render :xml => @frequencia_profissao, :status => :created, :location => @frequencia_profissao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frequencia_profissao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /frequencia/profissoes/1
  # PUT /frequencia/profissoes/1.xml
  def update
    @frequencia_profissao = Frequencia::Profissao.find(params[:id])

    respond_to do |format|
      if @frequencia_profissao.update_attributes(params[:frequencia_profissao])
        format.html { redirect_to(@frequencia_profissao, :notice => 'Profissão atualizada com sucesso') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frequencia_profissao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /frequencia/profissoes/1
  # DELETE /frequencia/profissoes/1.xml
  def destroy
    @frequencia_profissao = Frequencia::Profissao.find(params[:id])
    @frequencia_profissao.destroy

    respond_to do |format|
      format.html { redirect_to(frequencia_profissoes_url) }
      format.xml  { head :ok }
    end
  end
end
