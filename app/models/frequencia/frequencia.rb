class Frequencia::Frequencia < ActiveRecord::Base

  def self.save(upload)
      name =  upload['datafile'].original_filename
      #if name == /^.*\.(txt)$/
        directory = "public/txt"
        # create the file path
        path = File.join(directory, name)
        # write the file
        File.open(path, "w+") { |f| f.write(upload['datafile'].read) }
      #else
      #  errors.add_to_base("Arquivo","tipo inválido") unless datafile.empty?
      #end
  end

  def self.salvarPonto(c)
    raise c.inspect


  end

  def self.sel_usuario(matricula)

    b = Frequencia::Frequencia.order('data ASC').find(:all, :conditions => ["matricula = '#{matricula}' "])

    datas = []
    b.each do |data|
      datas << data.data.strftime("%d/%m/%Y") unless datas.include?(data.data.strftime("%d/%m/%Y"))
    end
    c = []

    datas.each do |p|
      i = 0
      a = {:matricula => matricula, :hora1 => '', :hora2 => '', :total1 => '', :data => ''}

      b.each do |z|
        if (z.data.strftime("%d/%m/%Y") == p)
          i = i+1
          a[("hora#{i}").to_sym] = z.data.strftime("%H:%M:%S")
          a[:data] = p
        end
      end
      hora1 = ChronicDuration.parse(a[:hora1])
      hora2 = ChronicDuration.parse(a[:hora2])
      calcHora = hora2 - hora1
      horaTotal = ChronicDuration.output(calcHora, :format => :chrono)
      a[:total1] = horaTotal

      c << a
    end

    salvarPonto(c)
  end

end
