Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, EnvVars.github_key, EnvVars.github_secret, scope: "user,repo"
end
