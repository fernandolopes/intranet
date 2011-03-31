class Usuarios::RegistrationsController < Devise::RegistrationsController
  #before_filter :authenticate_usuario!
 # prepend_before_filter :require_no_authentication, :only => [ :cancel ]
 # prepend_before_filter :authenticate_scope!, :only => [:edit, :new, :create, :update, :destroy]

  # GET /resource/sign_up
  def new
    build_resource({})
    render_with_scope :new
  end

  # POST /resource
  def create
    build_resource

    if resource.save
      #if resource.active?
      #  set_flash_message :notice, :signed_up
      #  sign_in_and_redirect(resource_name, resource)
      #else
      #  set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s
      #  expire_session_data_after_sign_in!
      #  redirect_to after_inactive_sign_up_path_for(resource)
      #end
      redirect_to usuarios_lista_path
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end

  # GET /resource/edit
  def edit
      render_with_scope :edit
  end


  # PUT /resource
  def update
    if resource.update_with_password(params[resource_name])
     # set_flash_message :notice, :updated
     # sign_in resource_name, resource, :bypass => true
     # redirect_to after_update_path_for(resource)
      redirect_to usuarios_lista_path
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end

  # DELETE /resource
  def destroy
    resource.destroy
    sign_out_and_redirect(self.resource)
    set_flash_message :notice, :destroyed
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    expire_session_data_after_sign_in!
    redirect_to new_registration_path(resource_name)
  end



end
