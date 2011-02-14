class HomeController < TemplateController
  before_filter :authenticate_usuario!
  
  def index
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
