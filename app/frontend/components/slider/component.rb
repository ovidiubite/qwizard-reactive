class Slider::Component < ApplicationViewComponent
  param :form
  param :key
  option :min, default: proc { 100 }
  option :max, default: proc { 400 }
end
