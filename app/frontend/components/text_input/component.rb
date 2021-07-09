class TextInput::Component < ApplicationViewComponent
  option :form
  option :field_name
  option :label_text, default: proc { '' }
  option :placeholder, default: proc { '' }

  # can be inline
  option :variant, default: proc { '' }

  option :input_data_attributes, default: proc { {} }

  def container_class
    @variant == 'inline' ? 'inlineInputContainer' : 'inputContainer'
  end

  def input_class
    @variant == 'inline' ? 'inlineInput' : 'input'
  end
end
