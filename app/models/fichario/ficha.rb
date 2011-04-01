class Fichario::Ficha < ActiveRecord::Base
  belongs_to :assunto
  belongs_to :origem
  has_many :andamento_fichas
  has_many :andamentos, :through => :andamento_fichas


  validates :pja, :interessado, :processo, :cpf, :entrada, :assunto_id, :origem_id, :presence => {:message => 'Não pode ser nulo'}
  validates :interessado, :length => {:minimum => 5, :message => 'Não pode ter menos de 5 caracteres'}
	validate :data_field
  usar_como_cpf :cpf

private
	def data_field
		errors.add("Data da pja","inválida") unless Date.valid?(pja)
    errors.add("Data da entrada","inválida") unless Date.valid?(entrada)
	end
end
