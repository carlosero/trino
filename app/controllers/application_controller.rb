class ApplicationController < ActionController::Base
  include BootstrapFlashHelper
  helper_method :bootstrap_flash
  protect_from_forgery

  before_filter :authenticate_user!

end
