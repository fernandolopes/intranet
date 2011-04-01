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
  #validates_format_of :datafile ,:with => /^.*\.(txt)$/, :on => :create

  def self.sel_usuario(matricula)
    #a = Frequencia::Frequencia.where("matricula=?",matricula).group(:matricula).select(:matricula)

    b = Frequencia::Frequencia.order('data ASC').find(:all, :conditions => ["matricula = '#{matricula}' "])
    a = {:matricula => matricula, :hora1 => '', :hora2 => '', :total1 => '', :data => ''}
    c = []
    i = 0
    b.each do |z|
      i = i+1
      a[("hora#{i}").to_sym] = z.data.strftime("%H:%M:%S")
      a[:data] = z.data.strftime("%d/%m/%Y")
    end
    c << a
    return c
    #raise a.inspect
  end

end
