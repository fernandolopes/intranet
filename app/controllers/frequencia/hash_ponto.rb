class Frequencia::HashPonto
  attr_accessor :hash_final
  
  # TODO - não sei o que ela faz bem mas mesmo recebendo um *args funciona
  # OPTIMIZE - Preciso melhorar essa classe de ponto
#destrincha a tabela frequencia_frequencias num hash no formato da tabela pontos
  def initialize(select, datas, usuarios, unico = false)
    @select = select
    @unico = true
    @hash_final = []
    @usuarios = usuarios
    @matricula = []
    @usuarios.each { |u| @matricula.push(u.matricula) }
    datas.each do |data|
      @justificativa = Frequencia::Justificada.where("data = '#{data}' and matricula in '#{@matricula.join(',')}'")
      raise @justificativa.inspect
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
              total += calculo_hora
            end
          end
        end
      else
        a = {:hora1 => '-', :hora2 => '-', :total_geral => 'Inconsistente'}
      end

      a = regra_horas(a)

      a[:data] = data
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
        if key.to_s.match /(hora)/
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
  # Remove os pontos batidos duas vezes.
  def regra_horas(a)

    if !a.blank? && a[:total_geral] != "Inconsistente"
      a.each_value do |z|
        a.each do |y|
          if ChronicDuration.parse(y[1]).between?(ChronicDuration.parse(z)+1,(ChronicDuration.parse(z)+800))
             a.delete(y[0])
          end
        end
      end
    end

    return a

  end

end