class Frequencia::FrequenciasController < TemplateController
  before_filter :authenticate_usuario!
  # GET /frequencia/frequencias
  # GET /frequencia/frequencias.xml
  def index

    #@datas = Ponto.group(:data).select(:data)
    #filtro"=>{"data(1i)"=>"", "data(2i)"=>"", "data(3i)"=>""}"
formar_data("03","2011")

    datas = false
    if params[:filtro]
      unless params[:filtro]['data(3i)'] == '' or params[:filtro]['data(2i)'] == '' or params[:filtro]['data(1i)'] == ' '
        @data = "#{params[:filtro]['data(3i)']}/#{params[:filtro]['data(2i)']}/#{params[:filtro]['data(1i)']}"
        datas = true
      end
    end

    if datas == false
      @frequencia_frequencias = Ponto.order('data ASC').paginate :page => params[:page], :per_page => 10
    else
      @frequencia_frequencias = Ponto.order('data ASC').find_all_by_data(@data).paginate :page => params[:page], :per_page => 10
    end

    @total = @frequencia_frequencias.count
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

    #Faz o upload do arquivo txt
    post = Frequencia::Frequencia.save(params[:upload])
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
      unless Frequencia::Frequencia.find(:all, :conditions => ["data = ?", l['data']]).count > 0
        @frequencia = Frequencia::Frequencia.new(l)
        @frequencia.save
      end
    end
    #destroi o arquivo.txt
    cleanup
    @matricula = current_usuario.matricula
    sel_usuario(@matricula)

    respond_to do |format|
      format.html { redirect_to(frequencia_frequencias_path, :notice => 'Lista de frequencia enviada com sucesso.') }
    end
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

private
  #espelha a tabela frequencia_frequencias em pontos
  def salvarPonto(c)
    #raise c.inspect
    ponto = Ponto.create(c)
    p = Ponto.all
    return p
  end

  #destrincha a tabela frequencia_frequencias num hash no formato da tabela pontos
  def sel_usuario(matricula)

    b = Frequencia::Frequencia.order('data ASC').find(:all, :conditions => ["matricula = '#{matricula}' "])

    datas = []
    b.each do |data|
      datas << data.data.strftime("%Y-%m-%d") unless datas.include?(data.data.strftime("%Y-%m-%d"))
    end
    c = []

    datas.each do |p|
      i = 0
      f = 0
      a = {:matricula => matricula}
      hora = []
      total = 0
      b.each do |z|
        if (z.data.strftime("%Y-%m-%d") == p)
          i = i+1
          a[("hora#{i}").to_sym] = z.data.strftime("%H:%M:%S")
          hora << ChronicDuration.parse(a[("hora#{i}").to_sym])
          if (hora.count % 2) == 0
            f = f+1

            calcHora = (hora[i-1] - hora[i-2])
            horaTotal = ChronicDuration.output(calcHora, :format => :chrono)
            a[("total#{i-f}").to_sym] = horaTotal
          end
        end
        a[:data] = p
      end
      total =  total + ChronicDuration.parse(a[:total1]) if a[:total1]
      total =  total + ChronicDuration.parse(a[:total2]) if a[:total2]
      total =  total + ChronicDuration.parse(a[:total3]) if a[:total3]
      a[:total_geral] = ChronicDuration.output(total, :format => :chrono)
      c << a
    end

    return salvarPonto(c)
  end

  #muda a data para o padrão americano.
  def mudar_data(data)
    d = data
		d =~ /(\d{2})\/(\d{2})\/(\d{2})/
		d = "20#{$3}-#{$2}-#{$1}"
  end

  #destroi o arquivo.
  def cleanup
    File.delete(@path) if File.exist?(@path)
  end

  #forma um Array com os dias úteis de um determinado mês
  def formar_data(mes,ano)
    datas = []

    for i in (1..31)
      d = Date.new(ano.to_i, mes.to_i, i)
      if Date.valid?("#{i}/#{mes}/#{ano}") and !(d.feriado?) and !(d.wday == 6 or d.wday == 0)
        data = Date.new(ano.to_i, mes.to_i, i)
        datas << data.to_s_br
      end
    end
  end
end
