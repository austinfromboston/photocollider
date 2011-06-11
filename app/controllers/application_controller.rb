class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def verify_juror
    raise "Only jurors can vote" unless current_user.juror?
  end

  def verify_superuser
    raise "Only superusers can do that" unless current_user.superuser?
  end
end
