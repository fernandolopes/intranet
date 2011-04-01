class Fichario::Assunto < ActiveRecord::Base
  has_many :fichas
  validates :descricao, :presence => {:message => 'Não pode ser nulo'}
end
