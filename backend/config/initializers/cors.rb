Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*", "http://192.168.126.142:3001"
    resource "/api/*", headers: :any, methods: [:get, :post, :patch, :put, :delete, :options, :head]
  end
end
