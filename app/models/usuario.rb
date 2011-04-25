# encoding: utf-8
class Usuario < ActiveRecord::Base
  # Include default usuarios modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  belongs_to :setor, :class_name => 'Frequencia::Setor'
  belongs_to :profissao, :class_name => 'Frequencia::Profissao'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login

  attr_accessible :login, :matricula, :setor_id, :profissao_id, :nome, :email, :password, :password_confirmation, :remember_me

protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["matricula = :value OR email = :value", { :value => login }]).first
  end

end
