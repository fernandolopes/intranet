class Frequencia::JustificativasController < TemplateController
    before_filter :authenticate_user!
  # GET /frequencia/justificativas
  # GET /frequencia/justificativas.xml
  def index
    @frequencia_justificativas = Frequencia::Justificativa.order('updated_at ASC').paginate :page => params[:page], :per_page => 10
    @total = Frequencia::Justificativa.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frequencia_justificativas }
    end
  end

  # GET /frequencia/justificativas/1
  # GET /frequencia/justificativas/1.xml
  def show
    @frequencia_justificativa = Frequencia::Justificativa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb.erb
      format.xml  { render :xml => @frequencia_justificativa }
    end
  end

  # GET /frequencia/justificativas/new
  # GET /frequencia/justificativas/new.xml
  def new
    @frequencia_justificativa = Frequencia::Justificativa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequencia_justificativa }
    end
  end

  # GET /frequencia/justificativas/1/edit
  def edit
    @frequencia_justificativa = Frequencia::Justificativa.find(params[:id])
  end

  # POST /frequencia/justificativas
  # POST /frequencia/justificativas.xml
  def create
    @frequencia_justificativa = Frequencia::Justificativa.new(params[:frequencia_justificativa])

    respond_to do |format|
      if @frequencia_justificativa.save
        format.html { redirect_to(@frequencia_justificativa, :notice => 'Justificativa salva com sucesso.') }
        format.xml  { render :xml => @frequencia_justificativa, :status => :created, :location => @frequencia_justificativa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frequencia_justificativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /frequencia/justificativas/1
  # PUT /frequencia/justificativas/1.xml
  def update
    @frequencia_justificativa = Frequencia::Justificativa.find(params[:id])

    respond_to do |format|
      if @frequencia_justificativa.update_attributes(params[:frequencia_justificativa])
        format.html { redirect_to(@frequencia_justificativa, :notice => 'Justificativa atualizada com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frequencia_justificativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /frequencia/justificativas/1
  # DELETE /frequencia/justificativas/1.xml
  def destroy
    @frequencia_justificativa = Frequencia::Justificativa.find(params[:id])
    @frequencia_justificativa.destroy

    respond_to do |format|
      format.html { redirect_to(frequencia_justificativas_url) }
      format.xml  { head :ok }
    end
  end
end
