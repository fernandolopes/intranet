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

end
