class TemplateController < ActionController::Base
    protect_from_forgery

  def data_americana data
    d = data
    d =~ /(\d{2})\/(\d{2})\/(\d{4})/
		d = "#{$3}-#{$2}-#{$1}"
  end
end
