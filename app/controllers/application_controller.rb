class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :set_device_type

  def season_list
  	@season_list ||= Season.archive_list.all.group_by(&:year)
  end
  helper_method :season_list

  def is_home?
  	@is_home ||= params[:controller] == 'home'
  end
  helper_method :is_home?

  def device_image_size
    browser.device.mobile? ? :large : :small
  end
  helper_method :device_image_size

  def is_tablet?
    browser.device.tablet?
  end
  helper_method :is_tablet?

private
  def set_device_type
    if browser.device.mobile?
      request.variant = :mobile
    else
      request.variant = :desktop
    end
  end

end
