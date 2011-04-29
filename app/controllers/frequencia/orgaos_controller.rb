# encoding: utf-8
class Frequencia::OrgaosController < TemplateController
  before_filter :authenticate_usuario!
  # GET /frequencia/orgaos
  # GET /frequencia/orgaos.xml
  def index
    @frequencia_orgaos = Frequencia::Orgao.order('updated_at ASC').paginate :page => params[:page], :per_page => 10
    @total = Frequencia::Orgao.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frequencia_orgaos }
    end
  end

  # GET /frequencia/orgaos/1
  # GET /frequencia/orgaos/1.xml
  def show
    @frequencia_orgao = Frequencia::Orgao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frequencia_orgao }
    end
  end

  # GET /frequencia/orgaos/new
  # GET /frequencia/orgaos/new.xml
  def new
    @frequencia_orgao = Frequencia::Orgao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequencia_orgao }
    end
  end

  # GET /frequencia/orgaos/1/edit
  def edit
    @frequencia_orgao = Frequencia::Orgao.find(params[:id])
  end

  # POST /frequencia/orgaos
  # POST /frequencia/orgaos.xml
  def create
    @frequencia_orgao = Frequencia::Orgao.new(params[:frequencia_orgao])

    respond_to do |format|
      if @frequencia_orgao.save
        format.html { redirect_to(@frequencia_orgao, :notice => 'Orgão criado com sucesso.') }
        format.xml  { render :xml => @frequencia_orgao, :status => :created, :location => @frequencia_orgao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frequencia_orgao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /frequencia/orgaos/1
  # PUT /frequencia/orgaos/1.xml
  def update
    @frequencia_orgao = Frequencia::Orgao.find(params[:id])

    respond_to do |format|
      if @frequencia_orgao.update_attributes(params[:frequencia_orgao])
        format.html { redirect_to(@frequencia_orgao, :notice => 'Orgão atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frequencia_orgao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /frequencia/orgaos/1
  # DELETE /frequencia/orgaos/1.xml
  def destroy
    @frequencia_orgao = Frequencia::Orgao.find(params[:id])
    @frequencia_orgao.destroy

    respond_to do |format|
      format.html { redirect_to(frequencia_orgaos_url) }
      format.xml  { head :ok }
    end
  end
end
