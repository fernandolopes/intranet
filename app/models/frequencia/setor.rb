class Frequencia::Setor < ActiveRecord::Base
  belongs_to :orgao
  has_many :usuarios
end
