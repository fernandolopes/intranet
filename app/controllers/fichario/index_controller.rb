class Fichario::IndexController < TemplateController
  before_filter :authenticate_user!
  def index

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
