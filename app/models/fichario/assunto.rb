class Fichario::Assunto < ActiveRecord::Base
  has_many :fichas
end
