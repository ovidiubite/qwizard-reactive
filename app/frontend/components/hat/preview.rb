# frozen_string_literal: true

class Hat::Preview < ApplicationViewComponentPreview
  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  def as_slide_image
    render_component(Hat::Component.new(hat_name: 'star', image_style: 'slideImage'))
  end

  def as_player_image
    render_component(Hat::Component.new(hat_name: 'star', image_style: 'playerImage'))
  end
end
