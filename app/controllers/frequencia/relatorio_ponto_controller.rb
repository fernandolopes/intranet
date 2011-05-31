class Frequencia::RelatorioPontoController < ReportController
  before_filter :authenticate_user!

  def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @obj_ponto }
    end
  end

  def show
    @titulo = 'Relatório de Ponto'

    authorize! :index, @user
    # Filtro para tabela
    if params.has_key?("ponto")
      if current_user.role != "administrador" and current_user != 'moderador'
        matricula = current_user.matricula
      else
        matricula =  params['ponto']['matricula']
      end

      @user =  User.find_by_matricula( matricula)

      unless Date.valid?(params['ponto']['data_init']) and Date.valid?(params['ponto']['data_final'])
        redirect_to(:controller => "frequencia/relatorio_ponto", :action => "index", :status=> :found, :flash => "Data inválida")
        return
      else
        data_init = params['ponto']['data_init'].to_date
        data_final = params['ponto']['data_final'].to_date
        @dat = {:inicial => data_init.to_s_br, :final => data_final.to_s_br}
      end

      if data_final < data_init
        redirect_to(:controller => "frequencia/relatorio_ponto", :action => "index", :status=> :found, :flash => "Data inicial não pode ser maior que a data final")
        return
      end

      @datas = Frequencia::DiasUteis.new(data_init,data_final).data_util

      if matricula.empty?
        redirect_to(:controller => "frequencia/relatorio_ponto", :action => "index", :status=> :found, :flash => "matricula não pode ser nula")
        return
      else
        @frequencias = Frequencia::Ponto.find_by_sql("
            SELECT * FROM frequencia_pontos
                where matricula = '#{matricula}'
                and ( date_format(data,'%Y-%m-%d') >= '#{data_init.strftime("%Y-%m-%d")}'
                and date_format(data,'%Y-%m-%d') <= '#{data_final.strftime("%Y-%m-%d")}')
        ")
      end
      @obj_ponto = Frequencia::HashPonto.new(@frequencias, @datas, matricula, true)
    else
      redirect_to(:controller => "frequencia/relatorio_ponto", :action => "index", :status=> :found, :flash => "Erro de rotas!")
      return
    end

    @matricula = matricula
    @total = @datas.count


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @obj_ponto }
    end
  end

end
