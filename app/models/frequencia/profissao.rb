class Frequencia::Profissao < ActiveRecord::Base
  has_many :usuarios

  before_save :deixar_maiusculo
  validates :profissao, :presence => {:message => 'Não pode ser nulo'}

private
  def deixar_maiusculo
    self.profissao.upcase!
  end
end
