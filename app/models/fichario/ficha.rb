class Fichario::Ficha < ActiveRecord::Base
  belongs_to :assunto
  belongs_to :origem
  has_many :andamento_fichas
  has_many :andamentos, :through => :andamento_fichas
end
