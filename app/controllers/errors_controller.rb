class ErrorsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
  layout 'error'

  def error_404
    render status: 404
  end

end
