class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:email, :password, :passwrd_confirmation, :party, :name, :age, :district_id, :image]
    devise_parameter_sanitizer.permit :sign_in, keys: [:phone, :password]
    devise_parameter_sanitizer.permit :account_update, keys: [:email, :password, :passwrd_confirmation, :party, :name, :age, :district_id, :image]
  end

  def detect_layout
    f7_request? ? false : "app"
  end

  def f7_request?
    request.format == "*/*"
  end

  def rails_routes
    routes = []
    Rails.application.routes.routes.each do |route|
      route_string = route.path.spec.to_s
      if !route_string.start_with?("/admin", "/assets", "/rails", "/cable")
        routes << {path: route_string.gsub("(.:format)", ""), componentUrl: route_string.gsub("(.:format)", "").gsub(":id", "{{id}}")}
      end
    end
    routes.uniq
  end
end
