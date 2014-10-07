class ApplicationController < ActionController::API
  include ::ActionController::Serialization

  def index
    render json: collection.to_a
  end

  def collection
    instance_variable_get "@#{model.pluralize.underscore}".to_sym
  end

  def model
    self.class.name.demodulize.sub /Controller/, ''
  end

  private
  
  #-> Prelang (user_login:devise)
  def require_user_signed_in
    unless user_signed_in?

      # If the user came from a page, we can send them back.  Otherwise, send
      # them to the root path.
      if request.env['HTTP_REFERER']
        fallback_redirect = :back
      elsif defined?(root_path)
        fallback_redirect = root_path
      else
        fallback_redirect = "/"
      end

      redirect_to fallback_redirect, flash: {error: "You must be signed in to view this page."}
    end
  end

end
