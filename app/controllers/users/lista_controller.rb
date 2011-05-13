class Users::ListaController < TemplateController
	#load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /fichario/fichas
  # GET /fichario/fichas.xml
  def index
     @users = User.order('id ASC').paginate :page => params[:page], :per_page => 10
     @total = User.all.count

		# unauthorized! if cannot? :index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # DELETE /fichario/fichas/1
  # DELETE /fichario/fichas/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_lista_url) }
      format.xml  { head :ok }
    end
  end
end
