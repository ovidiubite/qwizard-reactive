Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins /http:\/\/localhost:[0-9]+/

    resource '*',
             headers: :any,
             methods: [:get]
  end
end
