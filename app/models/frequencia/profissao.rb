# encoding: utf-8
class Frequencia::Profissao < ActiveRecord::Base
  has_many :users

  before_save :deixar_maiusculo
  validates :profissao, :presence => {:message => 'Não pode ser nulo'}

private
  def deixar_maiusculo
    self.profissao.upcase!
  end
end
