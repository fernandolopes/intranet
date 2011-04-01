class Base::Conhecimento < ActiveRecord::Base
  belongs_to :usuario
  validates :titulo, :descricao, :usuario_id, :presence => { :message => "Não pode ser nulo"}
end
