module ApplicationHelper
  def render_flash
    turbo_stream.update('flash', partial: 'shared/flash')
  end
end
