class Fichario::Ficha < ActiveRecord::Base
  belongs_to :assunto
  belongs_to :origem
end
