# encoding: utf-8
class Frequencia::Orgao < ActiveRecord::Base
  has_many :setores
  before_save :deixar_maiusculo
  validates :orgao, :presence => {:message => 'Não pode ser nulo'}

  private
  def deixar_maiusculo
    self.orgao.upcase!
  end
end
