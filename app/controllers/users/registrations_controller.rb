# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  prepend_before_filter :require_no_authentication, only: [:cancel ]

  # GET /resource/sign_up
  def new
    render template:"inscriptions/form", layout: false
  end

  # POST /resource
  def create
    super
    #@user=User.new(user_params)
    #p @user
    #if @user.save
    #  bypass_sign_in(@user)
    #  render template:"inscriptions/success"
    #else
    #  p @user.errors.messages
    #  case params[:mytype]
    #  when "collectifs"
    #    @mycourse=Collective.mycourse
    #  when "individuels"
    #    @mycourse=Private.mycourse
    #  end
    #  render template:"inscriptions/form", layout: false
    #end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def user_params
    params.require(:user).permit(:tva,:societe,:complementadresse,:civilite,:mytype,:terms,:level_id,:email,:password,:password_confirmation,:firstname,:lastname,:address,:city,:zip,:resp_firstname,:resp_lastname,:dateofbirth,:mobile,:landline,:film,:internet,:fb,:insta,:yt,:userweekdays_attributes=>{},:payments_attributes=>{},:course_ids=>[])
  end
  def configure_sign_up_params
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:level_id,:firstname,:lastname,:address,:city,:zip,:resp_firstname,:resp_lastname,:dateofbirth,:mobile,:landline,:film,:internet,:fb,:insta,:yt,:userweekdays_attributes=>{},:course_ids=>[]])
    devise_parameter_sanitizer.permit(:sign_up,keys:[:tva,:societe,:complementadresse,:civilite,:mytype,:terms,:level_id,:email,:password,:password_confirmation,:firstname,:lastname,:address,:city,:zip,:resp_firstname,:resp_lastname,:dateofbirth,:mobile,:landline,:film,:internet,:fb,:insta,:yt,:userweekdays_attributes=>{},:payments_attributes=>{},:course_ids=>[]])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:level_id,:firstname,:lastname,:address,:city,:zip,:resp_firstname,:resp_lastname,:dateofbirth,:mobile,:landline,:film,:internet,:fb,:insta,:yt,:course_ids=>[],:userweekdays_attributes=>{}])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    "inscriptions/success?mytype=#{resource.mytype}"
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
