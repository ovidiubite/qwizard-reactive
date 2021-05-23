require 'dry-initializer'

class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer

  include ApplicationHelper
  include Turbo::FramesHelper
  
  private

  def identifier
    @identifier ||= self.class.name.sub("::Component", "").underscore.split("/").join("--")
  end

  def class_for(name, from: identifier)
    "c-#{from}-#{name}"
  end
end
