# encoding: utf-8
class Frequencia::Justificativa < ActiveRecord::Base
  has_many :justificadas
  validates :descricao, :presence => {:message => 'Não pode ser nulo'}
end
