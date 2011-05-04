class Frequencia::HashPonto
  attr_accessor :hash_final
  
#destrincha a tabela frequencia_frequencias num hash no formato da tabela pontos
  def initialize(select, datas, matricula, unico = false)
    #raise select.inspect
    @select = select
    @unico = unico
    @hash_final = []
    datas.each do |data|
      @justificativa = Frequencia::Justificada.where("data = '#{data}' and matricula = '#{matricula}'")

      i = 0
      f = 0
      a = {}
      hora = []
      total = 0
      unless @select.blank?
        select.each do |dados|
          if (dados.data.strftime("%Y-%m-%d").to_date == data)
            i += 1
            a[("hora#{i}").to_sym] = dados.data.strftime("%H:%M:%S")
            hora << ChronicDuration.parse(a[("hora#{i}").to_sym])
            if (hora.count % 2) == 0
              f += 1
              calculo_hora = (hora[i-1] - hora[i-2])
              hora_total = ChronicDuration.output(calculo_hora, :format => :chrono)
              a[("total#{i-f}").to_sym] = hora_total
            end
          end
        end
      else
        a = {:hora1 => '-', :hora2 => '-', :total_geral => 'Inconsistente'}
      end
      #if data == "2011-02-08".to_date
      #a.delete :hora3
      #b = regra_horas(a)

      #end

      a[:data] = data
      total += ChronicDuration.parse(a[:total1]) if a[:total1]
      total += ChronicDuration.parse(a[:total2]) if a[:total2]
      total += ChronicDuration.parse(a[:total3]) if a[:total3]
      a[:total_geral] = ChronicDuration.output(total, :format => :chrono) if a[:total_geral].blank?
      a[:justificativa] = @justificativa[0].justificativa.descricao if !@justificativa[0].blank?
      @hash_final << a

    end
    return @hash_final
  end

  # Verifica se o hash está nulo
  def hash_nulo?
    has = false
    @hash_final.each do |x|
      if x.has_value?('Inconsistente') and @select.blank? and @justificativa.blank? and !@unico
        has = true
      end
    end
    return has
  end

  #retorna o número de colunas para horas
  def quant_horas
    maior = 0
    @hash_final.each do |array|
      i = 1
      array.each_key do |key|
        if key == ("hora#{i}").to_sym
          if i > maior
            maior = i
          end
          i+=1
        end
      end
    end
    return maior
  end

private
  def regra_horas(a)
    for i in (1..10)
      if a["hora#{i}".to_sym]
        ChronicDuration.parse(a["hora#{i}".to_sym]).between?(27000,37800)
      end
    end

  end

end