Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

end

# Rails.application.config.middleware.use OmniAuth::Builder do 
#   provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
# end
