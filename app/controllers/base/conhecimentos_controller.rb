class Base::ConhecimentosController < TemplateController
  before_filter :authenticate_user!
  uses_tiny_mce
  # GET /base/conhecimentos
  # GET /base/conhecimentos.xml
  def index
    @base_conhecimentos = Base::Conhecimento.order('updated_at ASC').paginate :page => params[:page], :per_page => 10
    @total = Base::Conhecimento.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @base_conhecimentos }
    end
  end

  # GET /base/conhecimentos/1
  # GET /base/conhecimentos/1.xml
  def show
    @base_conhecimento = Base::Conhecimento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @base_conhecimento }
    end
  end

  # GET /base/conhecimentos/new
  # GET /base/conhecimentos/new.xml
  def new
    @base_conhecimento = Base::Conhecimento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @base_conhecimento }
    end
  end

  # GET /base/conhecimentos/1/edit
  def edit
    @base_conhecimento = Base::Conhecimento.find(params[:id])
  end

  # POST /base/conhecimentos
  # POST /base/conhecimentos.xml
  def create
    @base_conhecimento = Base::Conhecimento.new(params[:base_conhecimento])

    respond_to do |format|
      if @base_conhecimento.save
        format.html { redirect_to(@base_conhecimento, :notice => 'Conhecimento adicionado com sucesso.') }
        format.xml  { render :xml => @base_conhecimento, :status => :created, :location => @base_conhecimento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @base_conhecimento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /base/conhecimentos/1
  # PUT /base/conhecimentos/1.xml
  def update
    @base_conhecimento = Base::Conhecimento.find(params[:id])

    respond_to do |format|
      if @base_conhecimento.update_attributes(params[:base_conhecimento])
        format.html { redirect_to(@base_conhecimento, :notice => 'Conhecimento atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @base_conhecimento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /base/conhecimentos/1
  # DELETE /base/conhecimentos/1.xml
  def destroy
    @base_conhecimento = Base::Conhecimento.find(params[:id])
    @base_conhecimento.destroy

    respond_to do |format|
      format.html { redirect_to(base_conhecimentos_url) }
      format.xml  { head :ok }
    end
  end
end
