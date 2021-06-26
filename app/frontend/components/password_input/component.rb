class PasswordInput::Component < ApplicationViewComponent
  option :form
  option :field_name
  option :label_text, default: proc { '' }
  option :placeholder, default: proc { '' }
end
