# encoding: utf-8
class Base::Conhecimento < ActiveRecord::Base
  belongs_to :user
  validates :titulo, :descricao, :user_id, :presence => { :message => "Não pode ser nulo"}
end
