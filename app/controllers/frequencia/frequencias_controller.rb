class Frequencia::FrequenciasController < TemplateController
  before_filter :authenticate_usuario!

  # GET /frequencia/frequencias
  # GET /frequencia/frequencias.xml
  def index

    # Filtro para tabela
    if params.has_key?("filtro")
      dia = params[:filtro]['data(3i)']
      mes = params[:filtro]['data(2i)']
      ano = params[:filtro]['data(1i)']
      if !dia.empty? and !mes.empty? and !ano.empty?
        @data = "#{dia}/#{mes}/#{ano}"
        @frequencia_frequencias = Ponto.order('data ASC').find_all_by_data(@data)
      elsif dia.empty? and !mes.empty? and !ano.empty?
        @datas = Frequencia::DiasUteis.new("0{mes}",ano) # formar_data("0#{mes}",ano)
        @frequencia_frequencias = monta_tabela @datas
      elsif dia.empty? and mes.empty? and ano.empty?
        data_atual = Time.now
        mes = data_atual.strftime("%m").to_s
        ano = data_atual.strftime("%Y").to_s
        @datas = Frequencia::DiasUteis.new(mes,ano) # formar_data(mes,ano)
        @frequencia_frequencias = monta_tabela @datas
      else
        @frequencia_frequencias = []
      end
    else
      data_atual = Time.now
      mes = data_atual.strftime("%m").to_s
      ano = data_atual.strftime("%Y").to_s
      @datas = Frequencia::DiasUteis.new(mes,ano) # formar_data(mes,ano)
      @frequencia_frequencias = monta_tabela @datas
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
    @frequencia_frequencia = Frequencia::Ponto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frequencia_frequencia }
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

  # GET /frequencia/frequencias/1/edit
  def edit
    @frequencia_frequencia = Frequencia::Ponto.find(params[:id])
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
    #@matricula = current_usuario.matricula
    #sel_usuario(@matricula)



    respond_to do |format|
      format.html { redirect_to(frequencia_frequencias_path, :notice => 'Lista de frequencia enviada com sucesso.') }
    end
  end

  # PUT /frequencia/frequencias/1
  # PUT /frequencia/frequencias/1.xml
  def update
    @frequencia_frequencia = Frequencia::Ponto.find(params[:id])

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
    @frequencia_frequencia = Frequencia::Ponto.find(params[:id])
    @frequencia_frequencia.destroy

    respond_to do |format|
      format.html { redirect_to(frequencia_frequencias_url) }
      format.xml  { head :ok }
    end
  end

private
  #espelha a tabela frequencia_frequencias em pontos
  def salvarPonto(hash_final)
    ponto = Ponto.create(hash_final)
  end
=begin
  #destrincha a tabela frequencia_frequencias num hash no formato da tabela pontos
  def sel_usuario(matricula)

    matricula_ponto = Frequencia::Ponto.order('data ASC').find(:all, :conditions => ["matricula = '#{matricula}' "])

    hash_datas = []
    matricula_ponto.each do |matriculas|
      hash_datas << matriculas.data.strftime("%Y-%m-%d") unless hash_datas.include?(matriculas.data.strftime("%Y-%m-%d"))
    end
    hash_final = []

    hash_datas.each do |p|
      i = 0
      f = 0
      a = {:matricula => matricula}
      hora = []
      total = 0
      matricula_ponto.each do |dados|
        if (dados.data.strftime("%Y-%m-%d") == p)
          i = i+1
          a[("hora#{i}").to_sym] = dados.data.strftime("%H:%M:%S")
          hora << ChronicDuration.parse(a[("hora#{i}").to_sym])
          if (hora.count % 2) == 0
            f = f+1

            calculo_hora = (hora[i-1] - hora[i-2])
            hora_total = ChronicDuration.output(calculo_hora, :format => :chrono)
            a[("total#{i-f}").to_sym] = hora_total
          end
        end
        a[:data] = p
      end
      total =  total + ChronicDuration.parse(a[:total1]) if a[:total1]
      total =  total + ChronicDuration.parse(a[:total2]) if a[:total2]
      total =  total + ChronicDuration.parse(a[:total3]) if a[:total3]
      a[:total_geral] = ChronicDuration.output(total, :format => :chrono)
      hash_final << a
    end

    return salvarPonto(hash_final)
=end

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

  #forma um Array com os dias úteis de um determinado mês
=begin
  def formar_data(mes,ano)
    @datas = []
    if mes.to_i > 9
      mes = "0#{mes}"
    end
    for i in (1..31)
      valida_data = Date.valid?("#{i}/#{mes}/#{ano}")
      d = Date.new(ano.to_i, mes.to_i, i) if valida_data

      if valida_data and !(d.feriado?) and !(d.wday == 6 or d.wday == 0)
        data = Date.new(ano.to_i, mes.to_i, i)
        @datas << data
      end
    end
    return @datas
=end

  # Método para montar a tabela de Ponto
  def monta_tabela datas
=begin
    frequencias = []
    datas.each do |date|
      #ponto = Ponto.find_by_data(date.strftime("%Y-%m-%d"))

      if ponto != nil
        frequencias << ponto
      else
         #ponto = []
         #ponto[:matricula] = current_usuario.matricula
         #ponto[:data] = date
         #frequencias << ponto
      end
    end
    return frequencias
=end

  end
end
