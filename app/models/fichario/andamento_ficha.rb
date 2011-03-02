class Fichario::AndamentoFicha < ActiveRecord::Base
  belongs_to :ficha
  belongs_to :andamento
end
