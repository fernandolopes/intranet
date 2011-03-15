class Usuarios::RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_usuario!

  def novo



  end

end
