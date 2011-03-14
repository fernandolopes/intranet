class Frequencia::FrequenciasController < TemplateController
  before_filter :authenticate_usuario!
  # GET /frequencia/frequencias
  # GET /frequencia/frequencias.xml
  def index
    @frequencia_frequencias = Frequencia::Frequencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frequencia_frequencias }
    end
  end


  # GET /frequencia/frequencias/1
  # GET /frequencia/frequencias/1.xml
  def show
    @frequencia_frequencia = Frequencia::Frequencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frequencia_frequencia }
    end
  end

  # GET /frequencia/frequencias/new
  # GET /frequencia/frequencias/new.xml
  def new
    @frequencia_frequencia = Frequencia::Frequencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequencia_frequencia }
    end
  end

  # GET /frequencia/frequencias/1/edit
  def edit
    @frequencia_frequencia = Frequencia::Frequencia.find(params[:id])
  end

  # POST /frequencia/frequencias
  # POST /frequencia/frequencias.xml
  def create



#    @frequencia_frequencia = Frequencia::Frequencia.new(params[:frequencia_frequencia])

#    respond_to do |format|
#      if @frequencia_frequencia.save
#        format.html { redirect_to(@frequencia_frequencia, :notice => 'Frequencia criada com sucesso.') }
#        format.xml  { render :xml => @frequencia_frequencia, :status => :created, :location => @frequencia_frequencia }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @frequencia_frequencia.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # PUT /frequencia/frequencias/1
  # PUT /frequencia/frequencias/1.xml
  def update
    @frequencia_frequencia = Frequencia::Frequencia.find(params[:id])

    respond_to do |format|
      if @frequencia_frequencia.update_attributes(params[:frequencia_frequencia])
        format.html { redirect_to(@frequencia_frequencia, :notice => 'Frequencia atualizada com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frequencia_frequencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /frequencia/frequencias/1
  # DELETE /frequencia/frequencias/1.xml
  def destroy
    @frequencia_frequencia = Frequencia::Frequencia.find(params[:id])
    @frequencia_frequencia.destroy

    respond_to do |format|
      format.html { redirect_to(frequencia_frequencias_url) }
      format.xml  { head :ok }
    end
  end
end
