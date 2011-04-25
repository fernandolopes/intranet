# encoding: utf-8
class Fichario::AndamentoFicha < ActiveRecord::Base
  belongs_to :ficha
  belongs_to :andamento

  validates :ficha_id, :andamento_id, :presence => {:message => 'Não pode ser nulo'}

end
