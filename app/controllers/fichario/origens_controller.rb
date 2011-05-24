class Fichario::OrigensController < TemplateController
  before_filter :authenticate_user!
  # GET /fichario/origens
  # GET /fichario/origens.xml
  def index
		authorize! :index, @user

    @fichario_origens = Fichario::Origem.order('created_at ASC').paginate :page => params[:page], :per_page => 10
    @total =  Fichario::Origem.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fichario_origens }
    end
  end

  # GET /fichario/origens/1
  # GET /fichario/origens/1.xml
  def show
		authorize! :index, @user

    @fichario_origem = Origem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fichario_origem }
    end
  end

  # GET /fichario/origens/new
  # GET /fichario/origens/new.xml
  def new
		authorize! :index, @user

    @fichario_origem = Origem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fichario_origem }
    end
  end

  # GET /fichario/origens/1/edit
  def edit
		authorize! :index, @user

    @fichario_origem = Origem.find(params[:id])
  end

  # POST /fichario/origens
  # POST /fichario/origens.xml
  def create
		authorize! :index, @user

    @fichario_origem = Origem.new(params[:fichario_origem])

    respond_to do |format|
      if @fichario_origem.save
        format.html { redirect_to(@fichario_origem, :notice => 'Origem criado com sucesso.') }
        format.xml  { render :xml => @fichario_origem, :status => :created, :location => @fichario_origem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fichario_origem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fichario/origens/1
  # PUT /fichario/origens/1.xml
  def update
		authorize! :index, @user

    @fichario_origem = Origem.find(params[:id])


    respond_to do |format|
      if @fichario_origem.update_attributes(params[:fichario_origem])
        format.html { redirect_to(@fichario_origem, :notice => 'Origem atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fichario_origem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichario/origens/1
  # DELETE /fichario/origens/1.xml
  def destroy
		authorize! :index, @user

    @fichario_origem = Origem.find(params[:id])
    @fichario_origem.destroy

    respond_to do |format|
      format.html { redirect_to(fichario_origens_url) }
      format.xml  { head :ok }
    end
  end
end
