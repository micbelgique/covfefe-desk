class Api::BaseController < ActionController::Base
  private

  def render_error(error)
    @errors = [error]
    render 'api/shared/errors'
  end
end
