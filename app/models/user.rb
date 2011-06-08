# encoding: utf-8
class User < ActiveRecord::Base
  # Include default usuarios modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable

	ROLES = %w[administrador moderator user]

  belongs_to :setor, :class_name => 'Frequencia::Setor'
  belongs_to 'tipo_de_contratacao', :class_name => 'Frequencia::TipoDeContratacao'
  belongs_to :profissao, :class_name => 'Frequencia::Profissao'
  belongs_to :hora, :class_name => 'Frequencia::Hora'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login

  attr_accessible :login, :matricula, 'tipo_de_contratacao_id', :setor_id, :profissao_id, :role, :nome, :email, :password, :password_confirmation, :remember_me

protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["matricula = :value OR email = :value", { :value => login }]).first
  end

end