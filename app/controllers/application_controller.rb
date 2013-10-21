class ApplicationController < ActionController::Base
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  protect_from_forgery

  before_filter :authenticate_user!
  ALERT_TYPES = [:error, :info, :success, :warning]

  def flashes_tag
    Rails.logger.error "OMGOMGOGM"
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = :success if type == :notice
      type = :error   if type == :alert
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, "&times;".html_safe, :class => "close", "data-dismiss" => "alert") +
                           msg.html_safe, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
  helper_method :flashes_tag
  helper_method :menu_text
end
