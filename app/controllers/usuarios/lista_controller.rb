class Usuarios::ListaController < TemplateController
  before_filter :authenticate_usuario!

  # GET /fichario/fichas
  # GET /fichario/fichas.xml
  def index
     @usuarios = Usuario.order('updated_at DESC').paginate :page => params[:page], :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuarios }
    end
  end

  # DELETE /fichario/fichas/1
  # DELETE /fichario/fichas/1.xml
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(usuarios_lista_url) }
      format.xml  { head :ok }
    end
  end
end
