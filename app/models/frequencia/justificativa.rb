# encoding: utf-8
class Frequencia::Justificativa < ActiveRecord::Base
  validates :descricao, :presence => {:message => 'Não pode ser nulo'}
end
