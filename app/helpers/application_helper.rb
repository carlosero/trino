module ApplicationHelper
  def format_date(date)
    date.blank? ? "" : I18n.l(date, :format => :long)
  end
end
