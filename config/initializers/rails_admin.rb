require 'i18n'
I18n.default_locale = :ru

RailsAdmin.config do |config|

  
  

  ### Popular gems integration

  ## == Devise ==

  config.authenticate_with do
    warden.authenticate! scope: :doctor
  end
  config.current_user_method(&:current_doctor)

  ## == Cancan ==

  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  RailsAdmin.config do |config|
    config.authorize_with :cancan #TODO add cancancan to rails_admin config
  end

  RailsAdmin.config do |config|
  config.main_app_name = [""]
  # or something more dynamic
  #config.main_app_name = Proc.new { |controller| [ "Cool app", "BackOffice - #{controller.params[:action].try(:titleize)}" ] }
end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
