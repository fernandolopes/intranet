class Frequencia::JustificadasController < TemplateController
  before_filter :authenticate_user!

	def index
		#@frequencia_justificadas = Frequencia::Justificada.all.paginate :page => params[:page], :per_page => 10
    @frequencia_justificadas = Frequencia::Justificada.find_by_sql('
      SELECT b.id, a.nome AS matricula, b.data, b.justificativa_id FROM frequencia_justificadas AS b
               INNER JOIN users AS a ON a.matricula = b.matricula
    ').paginate :page => params[:page], :per_page => 10

    @total = @frequencia_justificadas.count

		respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frequencia_justificadas }
    end
	end

  def show
    #@frequencia_justificada = Frequencia::Justificada.find(params[:id])
    @frequencia_justificada = Frequencia::Justificada.find_by_sql("
      SELECT b.id, a.nome AS matricula, b.data, b.justificativa_id FROM frequencia_justificadas AS b
               INNER JOIN users AS a ON a.matricula = b.matricula
               WHERE b.id = #{params[:id]}
    ")

    respond_to do |format|
      format.html # show.html.erb.erb
      format.xml  { render :xml => @frequencia_justificada }
    end
  end

  def new
    @frequencia_justificada = Frequencia::Justificada.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequencia_justificada }
    end
  end

  def edit
    @frequencia_justificada = Frequencia::Justificada.find(params[:id])
  end

  def create
    @frequencia_justificada = Frequencia::Justificada.new(params[:frequencia_justificada])

    respond_to do |format|
      if @frequencia_justificada.save
        format.html { redirect_to(@frequencia_justificada, :notice => 'Justificada salva com sucesso.') }
        format.xml  { render :xml => @frequencia_justificada, :status => :created, :location => @frequencia_justificada }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frequencia_justificada.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @frequencia_justificada = Frequencia::Justificada.find(params[:id])

    respond_to do |format|
      if @frequencia_justificada.update_attributes(params[:frequencia_justificada])
        format.html { redirect_to(@frequencia_justificada, :notice => 'Justificada atualizada com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frequencia_justificada.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @frequencia_justificada = Frequencia::Justificada.find(params[:id])
    @frequencia_justificada.destroy

    respond_to do |format|
      format.html { redirect_to(frequencia_justificadas_url) }
      format.xml  { head :ok }
    end
  end

end
