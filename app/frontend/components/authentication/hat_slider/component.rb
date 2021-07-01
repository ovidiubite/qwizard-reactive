class Authentication::HatSlider::Component < ApplicationViewComponent
  param :form
  param :key

  def hats
    %w[star earth spiral gnome nature fire swamp water]
  end
end
