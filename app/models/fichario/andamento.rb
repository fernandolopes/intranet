class Fichario::Andamento < ActiveRecord::Base
  has_many :andamento_fichas
  has_many :fichas, :through => :andamento_fichas
end
