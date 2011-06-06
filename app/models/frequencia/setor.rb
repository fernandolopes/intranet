# encoding: utf-8
class Frequencia::Setor < ActiveRecord::Base
  belongs_to :orgao
  has_many :users

  before_save :deixar_maiusculo
  validates :setor, :orgao_id, :presence => {:message => 'Não pode ser nulo'}
  validates :setor, :uniqueness => {:message => "Deve ser único"}

private
  def deixar_maiusculo
    self.setor.upcase!
  end
end
