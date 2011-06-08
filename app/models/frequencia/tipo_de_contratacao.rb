# encoding: utf-8
class Frequencia::TipoDeContratacao < ActiveRecord::Base
  has_many :users

  before_save :deixar_maiusculo
  validates :titulo, :presence => {:message => 'Não pode ser nulo'}
  validates :titulo, :uniqueness => {:message => "Deve ser único"}

private
  def deixar_maiusculo
    self.titulo.upcase!
  end
end
