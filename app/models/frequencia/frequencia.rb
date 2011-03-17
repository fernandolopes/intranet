class Frequencia::Frequencia < ActiveRecord::Base

  validates :matricula, :presence => {:message => 'Não pode ser nulo'}
  validate :data_field

private
	def data_field
		errors.add("Data","inválida") unless Date.valid?(data)
	end

end
