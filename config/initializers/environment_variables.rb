require 'ee_cummings'
require 'dotenv'
Dotenv.load

EnvVars = EECummings

EnvVars.configure do |c|
  c.variable do |var|
    var.name = 'GITHUB_KEY'
  end

  c.variable do |var|
    var.name = 'GITHUB_SECRET'
  end
end
