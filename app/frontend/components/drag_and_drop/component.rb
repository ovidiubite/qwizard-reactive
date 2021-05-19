class DragAndDrop::Component < ApplicationViewComponent
  param :form

  option :label, default: proc { 'File' }
end
