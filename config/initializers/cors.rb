# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'example.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end


# config.middleware.use "Rack::Cors" do
#   allow do
#     origins '*'
#     resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :options]
#   end
# end


# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   # Insert CORS request headers for API responses
#   allow do
#     # Access-Control-Allow-Origin: (Origin に書かれたものをそのまま返す)
#     origins '*'

#     # /api 以下の URL に対してのみ、CORS 対応
#     # Access-Control-Allow-Methods: GET, POST, OPTIONS
#     # Access-Control-Allow-Headers: (OPTIONS に対してのみ Access-Control-Request-Headers に書かれたものをそのまま返す)
#     # Access-Control-Max-Age: 3600
#     resource '/api/*',
#              :methods => [:get, :post, :options],
#              :headers => :any,
#              :max_age => 3600
#   end
# end