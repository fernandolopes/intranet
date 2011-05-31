class Frequencia::DiasUteis
  attr_accessor :data_util

  def initialize(data1, data2)

    data_ini = data1
    data_fin = data2

    @data_util = [data_ini]
    d = data_ini

    while d < data_fin
       d = d + 1.days
       if d.between?(data_ini,data_fin)
         if !(d.feriado?) and !(d.wday == 6 or d.wday == 0)
          @data_util << d
         end
       end
    end
  end

end