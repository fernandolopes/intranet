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
  before_save :antes

  def antes
    a = Ponto.find(:all, :conditions => ["data = #{data} and matricula = #{matricula}"])
    if a
      raise a.inspect
    end
  end

end
