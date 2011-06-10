# encoding: utf-8
class Frequencia::AdminsController < TemplateController
  before_filter :authenticate_user!

  # GET /frequencia/frequencias
  # GET /frequencia/frequencias.xml
  def index
  authorize! :index, @puser

    respond_to do |format|
      format.html # index.html.erb
    end
  end

 # GET /frequencia/frequencias/1
  # GET /frequencia/frequencias/1.xml
  def show
    authorize! :index, @user

      # se o usuario logado não for administrador ou moderador só pega a sua frequencia
      # mas se for administrador ou moderador pode pegar a sua e a de qualquer outro
      if (current_user.role != "administrador" || current_user != 'moderador') && !params['ponto']['matricula'].blank?
        @user = current_user
      elsif !params['ponto']['matricula'].blank?
        @user = User.find_by_matricula(params['ponto']['matricula'])
      else
        @user = User.all
      end

      # verifica se a data inicial e a data final são validas se não retorna um erro
      if not Date.valid?(params['ponto']['data_init']) && Date.valid?(params['ponto']['data_final'])
        redirect_to(:controller => "frequencia/admins", :action => "index", :status=> :found, :flash => "Data inválida")
        return
      # verifica se a data inicial é maior que a data final se for retorna erro de que a data inicial é maior que a final
      elsif params['ponto']['data_final'].to_date < params['ponto']['data_init'].to_date
        return redirect_to(:controller => "frequencia/admins", :action => "index", :status=> :found, :flash => "Data inicial não pode ser maior que a data final")
      else
      # TODO - Lembrar de analisar o que a classe DiasUteis faz com as datas recebidas do parametro
        data_init = params['ponto']['data_init'].to_date
        data_final = params['ponto']['data_final'].to_date
        @datas = Frequencia::DiasUteis.new(data_init,data_final).data_util
      end

      if @user.empty?
        return redirect_to(:controller => "frequencia/admins", :action => "index", :status=> :found, :flash => "matricula não pode ser nula")
      else
        # FIXME - fudeu tem q ver o pq ele so ta pegando meu usuario e nao todos...
        @frequencias = Frequencia::Ponto.find_by_sql("
            SELECT * FROM frequencia_pontos
                WHERE ( date_format(data,'%Y-%m-%d') >= '#{data_init.strftime("%Y-%m-%d")}'
                AND date_format(data,'%Y-%m-%d') <= '#{data_final.strftime("%Y-%m-%d")}')
                AND matricula IN (SELECT users.matricula FROM users)
                ORDER BY frequencia_pontos.matricula
        ")
      end

      @obj_ponto = Frequencia::HashPonto.new(@frequencias, @datas, @user, true)
    #else
     # redirect_to(:controller => "frequencia/admins", :action => "index", :status=> :found, :flash => "Erro de rotas!")
     # return
    #end

    @total = @datas.count


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @obj_ponto }
    end

  end

  # GET /frequencia/frequencias/new
  # GET /frequencia/frequencias/new.xml
  def new

   @frequencia_frequencia = Frequencia::Ponto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequencia_frequencia }
    end
  end

  # POST /frequencia/frequencias
  # POST /frequencia/frequencias.xml
  def create

    #Faz o upload do arquivo txt
    post = Frequencia::Ponto.save(params[:upload])
    @path = "public/txt/#{params['upload']['datafile'].original_filename}"

    #Quebra as linhas do arquivo.txt e as envia para um Array
    file = []
    File.open(@path) do |f|
	    while line = f.gets
		    file << line
	    end
    end

    #Cria um hash com os campos data + hora e matricula
    #(note que em matricula foi dado um strip para cortar os espaços em branco)
    a = []

    file.each do |c|

      x = c.split("\,")

      y = mudar_data(x[0])+' '+x[1]
      a << {"data" => y.to_datetime, "matricula" => x[3].strip}
    end

    #Aqui é salvo todas as linhas do hash
    a.each do |l|
      consultaData = Frequencia::Ponto.find(:all, :conditions => ["data = ?", l['data']])
      if consultaData.empty?
        @frequencia = Frequencia::Ponto.new(l)
        @frequencia.save
      end
    end
    #destroi o arquivo.txt
    cleanup

    respond_to do |format|
      format.html { redirect_to(frequencia_admins_path, :notice => 'Lista de frequencia enviada com sucesso.') }
    end
  end

private
  #muda a data para o padrão americano.
  def mudar_data(data)
    d = data
		d =~ /(\d{2})\/(\d{2})\/(\d{2})/
		d = "20#{$3}-#{$1}-#{$2}"
  end

  #destroi o arquivo.
  def cleanup
    File.delete(@path) if File.exist?(@path)
  end

end
