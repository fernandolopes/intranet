class LoginsController < SessionsController
  # GET /logins
  # GET /logins.xml
  def index
    @login = Usuario.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logins }
    end
  end



  # GET /logins/new
  # GET /logins/new.xml
  def new
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @login }
    end
  end

 
end
