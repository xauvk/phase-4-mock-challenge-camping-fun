class ApplicationController < ActionController::API
  include ActionController::Cookies
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error

  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record_error

  private
  
  def render_not_found_error(not_found)
    render json: {errors: not_found.message}, status: :not_found
  end

  def render_invalid_record_error(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

end
