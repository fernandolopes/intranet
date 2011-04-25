# encoding: utf-8
class Fichario::Origem < ActiveRecord::Base
  has_many :fichas
  before_save :deixar_maiusculo
  validates :descricao, :presence => {:message => 'Não pode ser nulo'}

private
  def deixar_maiusculo
    self.descricao.upcase!
  end
end
