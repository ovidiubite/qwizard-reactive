# Qwizard Reactive Rails

# Storybook
Qwizard also has Storybook support! To take advantage of it, follow the steps below:
- Write component stories in `spec/components/stories`.
- Transpile your stories with `rake view_component_storybook:write_stories_json`
- Build the new Storybook with `yarn storybook:build`
- Run the Rails server with `rails s`
- Run the Webpack server with `bin/webpack-dev-server`
- Navigate to [the Storybook page](http://localhost:3000/_storybook/index.html) and enjoy your stories!
