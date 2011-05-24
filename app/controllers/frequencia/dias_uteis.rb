class Frequencia::DiasUteis
  attr_accessor :data_util

  def initialize(data1, data2)
    data_ini = data1.to_date
    data_fin = data2.to_date

    soma_data = (data_fin-data_ini).to_int
    @data_util = [data_ini]
    d = data_ini

    for i in (1..soma_data)
       d = d + 1.days
       if d.between?(data_ini,data_fin)
         if !(d.feriado?) and !(d.wday == 6 or d.wday == 0)
          @data_util << d
         end
       end
    end
  end

end