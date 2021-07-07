ActiveSupport.on_load(:view_component_storybook) do
  module ViewComponent
    module Storybook
      class Stories
        class << self

          private

          def default_component
            (name.chomp("Stories").chomp("Component") + '::Component').constantize
          end
        end
      end

      module Controls
        class ControlConfig
          def component_params
            params = component.dry_initializer.params.map { |param| [param.default ? :opt : :req, param.source] }
            options = component.dry_initializer.options.map { |opt| [opt.default ? :key : :keyreq, opt.source] }

            params + options
          end
        end
      end
    end
  end
end
