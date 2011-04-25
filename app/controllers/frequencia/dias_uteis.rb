class Frequencia::DiasUteis
  attr_accessor :data_util

  def initialize(mes,ano)
    @data_util = []
    if mes.to_i > 9
      mes = "0#{mes}"
    end
    for i in (1..31)
      valida_data = Date.valid?("#{i}/#{mes}/#{ano}")
      d = Date.new(ano.to_i, mes.to_i, i) if valida_data

      if valida_data and !(d.feriado?) and !(d.wday == 6 or d.wday == 0)
        data = Date.new(ano.to_i, mes.to_i, i)
        @data_util << data
      end
    end

  end

end