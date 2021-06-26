class TextInput::Component < ApplicationViewComponent
  option :form
  option :field_name
  option :label_text, default: proc { '' }
  option :placeholder, default: proc { '' }
  option :value, default: proc { '' }
end
