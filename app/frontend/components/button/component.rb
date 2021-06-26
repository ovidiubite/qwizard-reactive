class Button::Component < ApplicationViewComponent
  param :title

  option :background_color, default: proc { 'turqouise' }
  option :color, default: proc { 'white' }
  option :submit, default: proc { true }
  option :outline, default: proc { false }
end
