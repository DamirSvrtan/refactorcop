require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic, "Recovering Vegetarian Area" do |username, password|
  AdminAuthentication.call(username, password)
end

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV['REDIS_URL'],
    size: 4
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV['REDIS_URL'],
    size: 1
  }
end
