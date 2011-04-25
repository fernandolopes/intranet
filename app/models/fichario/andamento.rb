# encoding: utf-8
class Fichario::Andamento < ActiveRecord::Base
  has_many :andamento_fichas
  has_many :fichas, :through => :andamento_fichas

  validates :descricao, :presence => {:message => 'Não pode ser nulo'}
end
