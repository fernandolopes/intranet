class Frequencia::SetoresController < TemplateController
  before_filter :authenticate_user!
  # GET /frequencia/setores
  # GET /frequencia/setores.xml
  def index
    @frequencia_setores = Frequencia::Setor.order('updated_at ASC').paginate :page => params[:page], :per_page => 10
    @total = Frequencia::Setor.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frequencia_setores }
    end
  end

  # GET /frequencia/setores/1
  # GET /frequencia/setores/1.xml
  def show
    @frequencia_setor = Frequencia::Setor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb.erb
      format.xml  { render :xml => @frequencia_setor }
    end
  end

  # GET /frequencia/setores/new
  # GET /frequencia/setores/new.xml
  def new
    @frequencia_setor = Frequencia::Setor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequencia_setor }
    end
  end

  # GET /frequencia/setores/1/edit
  def edit
    @frequencia_setor = Frequencia::Setor.find(params[:id])
  end

  # POST /frequencia/setores
  # POST /frequencia/setores.xml
  def create
    @frequencia_setor = Frequencia::Setor.new(params[:frequencia_setor])

    respond_to do |format|
      if @frequencia_setor.save
        format.html { redirect_to(@frequencia_setor, :notice => 'Setor salvo com sucesso.') }
        format.xml  { render :xml => @frequencia_setor, :status => :created, :location => @frequencia_setor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frequencia_setor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /frequencia/setores/1
  # PUT /frequencia/setores/1.xml
  def update
    @frequencia_setor = Frequencia::Setor.find(params[:id])

    respond_to do |format|
      if @frequencia_setor.update_attributes(params[:frequencia_setor])
        format.html { redirect_to(@frequencia_setor, :notice => 'Setor atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frequencia_setor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /frequencia/setores/1
  # DELETE /frequencia/setores/1.xml
  def destroy
    @frequencia_setor = Frequencia::Setor.find(params[:id])
    @frequencia_setor.destroy

    respond_to do |format|
      format.html { redirect_to(frequencia_setores_url) }
      format.xml  { head :ok }
    end
  end
end
